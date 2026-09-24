local function log(msg)
	local f = io.open("/tmp/hypr-debug.log", "a")
	if f then
		f:write(os.date("%H:%M:%S") .. " " .. msg .. "\n")
		f:close()
	end
end

local window_ws_cache = {}

local function remember_workspace(w)
	if not w or not w.address then
		return nil
	end
	local old_ws_id = window_ws_cache[w.address]
	window_ws_cache[w.address] = w.workspace and w.workspace.id or nil
	return old_ws_id
end

local function sync_workspace(ws_id)
	if not ws_id then
		log("sync_workspace called with nil ws_id")
		return
	end

	local members = {}
	for _, w in pairs(hl.get_windows()) do
		if w.workspace and w.workspace.id == ws_id then
			log(
				string.format(
					"member: id=%s class=%s floating=%s",
					tostring(w.address),
					tostring(w.class),
					tostring(w.floating)
				)
			)
			table.insert(members, w)
		end
	end

	log(string.format("workspace %s had %d members(s)", tostring(ws_id), #members))

	if #members >= 2 then
		for _, w in pairs(members) do
			hl.dispatch(hl.dsp.window.float({
				action = "disable",
				window = w,
			}))
		end
	elseif #members == 1 then
		local w = members[1]
		hl.dispatch(hl.dsp.window.float({
			action = "enable",
			window = w,
		}))
		hl.dispatch(hl.dsp.window.center({ window = w }))
	end
end

hl.on("window.open", function(w)
	if not w then
		return
	end

	-- Set initial floating state once, at open time
	hl.dispatch(hl.dsp.window.float({
		action = "enable",
		window = w,
	}))
	hl.dispatch(hl.dsp.window.center({ window = w }))

	remember_workspace(w)

	if w and w.workspace then
		sync_workspace(w.workspace.id)
	end
end)

hl.on("window.close", function(w)
	if not w then
		return
	end

	local old_ws_id = w.address and window_ws_cache[w.address]
	if w.address then
		window_ws_cache[w.address] = nil
	end
	if old_ws_id then
		sync_workspace(old_ws_id)
	elseif w.workspace then
		sync_workspace(w.workspace.id)
	end
end)

hl.on("window.move_to_workspace", function(w)
	if not w or not w.workspace then
		return
	end

	local old_ws_id = remember_workspace(w)
	local new_ws_id = w.workspace.id

	sync_workspace(new_ws_id)
	if old_ws_id and old_ws_id ~= new_ws_id then
		sync_workspace(old_ws_id)
	end
end)

-- -- Helping floating windows cascade on each other
-- local CASCADE_STEP = 40 -- px per step
-- local CASCADE_MAX = 6 -- wrap after this many, back to 0 offset
--
-- hl.on("window.open", function(w)
-- 	if not (w and w.workspace) then
-- 		return
-- 	end
-- 	local ws_id = w.workspace.id
--
-- 	hl.timer(function()
-- 		if not w.floating then
-- 			return
-- 		end -- tiled windows don't need this
--
-- 		local siblings = 0
-- 		for _, other in pairs(hl.get_windows()) do
-- 			if other.address ~= w.address and other.workspace and other.workspace.id == ws_id and other.floating then
-- 				siblings = siblings + 1
-- 			end
-- 		end
--
-- 		local step = siblings % CASCADE_MAX
-- 		hl.dispatch(hl.dsp.window.move({
-- 			x = step * CASCADE_STEP,
-- 			y = step * CASCADE_STEP,
-- 			relative = true,
-- 			window = w,
-- 		}))
-- 	end, { timeout = 0 })
-- end)
