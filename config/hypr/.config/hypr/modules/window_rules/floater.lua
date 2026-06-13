--- Floater ---

-- Makes the floating windows centered
hl.window_rule({
	name = "Floating windows",
	match = {
		initial_class = "ghostty",
	},
	float = true,
	size = {
		"monitor_w * 0.5",
		"monitor_h * 0.5",
	},
	center = true,
})
