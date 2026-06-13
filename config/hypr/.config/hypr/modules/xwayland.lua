--- XWayland Support ---

hl.config({
	xwayland = {
		-- Allow running applications using X11
		enabled = true,

		-- uses the nearest neighbor filtering for xwayland apps,
		-- making them pixelated rather than blurry
		use_nearest_neighbor = true,

		-- forces a scale of 1 on xwayland windows on scaled displays.
		force_zero_scaling = false,

		-- Create the abstract Unix domain socket
		-- for XWayland connections.
		-- (XWayland restart is required for changes
		-- to take effect; Linux only)
		create_abstract_socket = false,
	},
})
