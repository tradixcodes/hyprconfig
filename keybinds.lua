local programs = require("modules.programs")
local mainMod = "SUPER"

-- Applications
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(programs.terminal))

hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(programs.browser))

hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd(programs.fileManager))

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(programs.menu))

hl.bind("PRINT", hl.dsp.exec_cmd(programs.screencapture))

-- Close current focused window
hl.bind(mainMod .. " + W", hl.dsp.window.close())

-- Arrow key navigation
hl.bind(mainMod .. " + LEFT", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + UP", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + DOWN", hl.dsp.focus({ direction = "down" }))

for i = 1, 9 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i, on_current_monitor = false }))
end

-- Move window on the same workspace
hl.bind(mainMod .. " + SHIFT + LEFT", hl.dsp.window.swap({ direction = "left" }))

-- Move window on the same workspace
hl.bind(mainMod .. " + SHIFT + RIGHT", hl.dsp.window.swap({ direction = "right" }))

for i = 1, 9 do
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, follow = true }))
end

-- Window resizing keybinds
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))

-- Mouse resizing
hl.bind(mainMod .. "+ mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. "+ mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
