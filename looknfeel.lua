hl.config({
	general = {
		layout = "scrolling",

		border_size = 0,
		gaps_in = 4,
		gaps_out = 8,

		resize_on_border = true,
		snap = {
			enabled = true,
			window_gap = 8,
			respect_gaps = true,
		},
	},
	decoration = {
		rounding = 8,
		blur = {
			enabled = true,
			size = 8,
			passes = 3,
			vibrancy = 0.25,
			vibrancy_darkness = 0.3,
			contrast = 0.95,
			brightness = 1.0,
			noise = 0.0117,
			new_optimizations = true,
			ignore_opacity = true,
			xray = false,
			popups = true,
		},
		active_opacity = 1.0,
		inactive_opacity = 0.90,
		dim_inactive = true,
		dim_strength = 0.15,

		-- Spotlight your scratchpad when you open it
		-- dim_special = 0.25,
	},
})

-- hl.config({
--	misc = {
--		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
--		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
--	},
-- })
