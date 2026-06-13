hl.config({
	input = {
		-- Keyboards
		kb_model = "",
		kb_layout = "us",
		kb_variant = "",
		kb_options = "ctrl:nocaps",
		kb_rules = "",

		numlock_by_default = true,

		repeat_rate = 10, --per second
		repeat_delay = 600, --ms

		-- Mouse
		follow_mouse = 1,
		sensitivity = 0,
		accel_profile = "",
		-- force_no_accel = true, -- good for gamemode
		left_handed = false,

		-- Touchpad
		touchpad = {
			disable_while_typing = true,
			natural_scroll = true,
		},
	},
})
