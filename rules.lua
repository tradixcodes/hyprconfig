-- keeps SUPER + SHIFT + L/R from leaking into another workspace
-- (when switching focus from one window to another on the same workspace)
hl.config({
	binds = {
		window_direction_monitor_fallback = false,
	},
})

-- keeps the first workspace persistent on the laptop screen
hl.workspace_rule({
	workspace = "1",
	monitor = "eDP-1",
	persistent = true,
	default = true,
})

hl.window_rule({
	name = "float-size",
	match = { class = ".*" },
	center = true,
	persistent_size = true,
	size = { "monitor_w * 0.7", "monitor_h * 0.8" },
})
-- hl.window_rule({
-- 	name = "float-by-default",
-- 	match = { class = ".*" }, -- empty match = applies to all windows
-- 	float = true,
-- 	center = true,
-- 	persistent_size = true,
-- 	size = { "monitor_w * 0.7", "monitor_h * 0.8" },
-- })

-- hl.window_rule({
-- 	name = "aether-float-centered",
-- 	match = { class = "^Aether$" },
-- 	float = true,
-- 	center = true,
-- 	size = { "monitor_w * 0.8", "monitor_h * 0.8" },
-- })

-- hl.window_rule({
-- 	name = "float-terminal",
-- 	match = { class = "kitty" },
-- 	float = true,
-- 	size = { "monitor_w * 0.5", "monitor_h * 0.5" },
-- 	center = true,
-- })
--
-- hl.window_rule({
-- 	name = "float-chromium",
-- 	match = { class = "chromium" },
-- 	float = true,
-- 	size = { "monitor_w * 0.8", "monitor_h * 0.8" },
-- 	center = true,
-- })
