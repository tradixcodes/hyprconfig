-- used to float the active window before moving it into another workspace
local function float_moving_window(target_ws_id)
	local w = hl.get_active_window()
	if not w then
		return
	end

	-- Float it
	hl.dispatch(hl.dsp.window.float({
		action = "set",
		window = w,
	}))
end

local function sync_workspace(ws_id)
	if not ws_id then
		return
	end

	local members = {}
	for _, w in pairs(hl.get_windows()) do
		if w.workspace and w.workspace.id == ws_id then
			table.insert(members, w)
		end
	end

	if #members >= 2 then
		for _, w in pairs(members) do
			hl.dispatch(hl.dsp.window.float({
				action = "unset",
				window = w,
			}))
		end
	end
end

hl.on("window.open", function(w)
	if w and w.workspace then
		sync_workspace(w.workspace.id)
	end
end)

hl.on("window.close", function(w)
	if w and w.workspace then
		sync_workspace(w.workspace.id)
	end
end)

hl.on("window.move_to_workspace", function(w)
	if w and w.workspace then
		float_moving_window(w)
		sync_workspace(w.workspace.id)
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
