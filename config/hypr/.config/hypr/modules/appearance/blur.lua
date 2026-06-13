--- Blur ---

hl.config({
	decoration = {
		blur = {
			enabled = true,

			size = 20,
			passes = 1,

			ignore_opacity = true,

			new_optimizations = true,

			xray = false,

			noise = 0.025,

			contrast = 0.750,
			brightness = 0.850,
			vibrancy = 0.1150,
			vibrancy_darkness = 0.0050,

			special = false,
			popups = true,
		},

		-- motion_blur = {
		-- 	enabled = true,
		-- 	samples = 7,
		-- },
	},
})
