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
	name = "aether-float-centered",
	match = { class = "^Aether$" },
	float = true,
	center = true,
	size = { "monitor_w * 0.8", "monitor_h * 0.8" },
})

hl.window_rule({
	name = "float-terminal",
	match = { class = "kitty" },
	float = true,
	size = { "monitor_w * 0.5", "monitor_h * 0.5" },
	center = true,
})
