--- Workspaces ---

local mainMod = require("modules.options").mainMod

-- Navigation and Moving between Workspaces :
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scratch Workspace
hl.bind(mainMod .. " + S", hl.dsp.focus({ workspace = 50 }))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = 50 }))

-- some more "hl.dsp.workspace." features
-- rename({ workspace, name? })	            rename a workspace
-- move({ workspace?, monitor })	        move a workspace to a monitor
-- swap_monitors({ monitor1, monitor2 })	swap current workspaces of two monitors
-- toggle_special(special_name)	            toggle a special workspace by name
