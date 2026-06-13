--- Shadows ---

hl.config({
	decoration = {
		shadow = {
			enabled = true,

			range = 15,
			render_power = 2,
			sharp = false,

			-- TODO : Make colors dynamic
			color = 0xee1a1a1a,
			color_inactive = 0xee1a1a1a,

			offset = { 5, 5 },
			scale = 1.0,
		},
	},
})
