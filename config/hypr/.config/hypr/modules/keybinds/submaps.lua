--- Sub Maps ---
local mainMod = "SUPER"

-- Refresh
hl.bind(mainMod .. " + R", hl.dsp.submap("refresh"))
hl.define_submap("refresh", function()
	hl.bind("H", function()
		hl.dispatch(hl.dsp.exec_cmd("hyprpaper"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)
	hl.bind("W", function()
		hl.dispatch(hl.dsp.exec_cmd("killall waybar && waybar"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Resize
hl.bind(mainMod .. " + ALT + R", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
	-- Set repeating binds for resizing the active window.
	hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
	hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })

	-- Use `reset` to go back to the global submap
	hl.bind("escape", hl.dsp.submap("reset"))
end)
