--- Peripherals ---

local mainMod = require("modules.options").mainMod
local utils = require("modules.vars.utilities")
local func = require("modules.functions.functions")

-- Brightness Control :
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(utils.screen.brightnessUp))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(utils.screen.brightnessDown))

-- Mouse Actions:
hl.bind(mainMod .. " + mouse:272", function()
    func.drag()
end)
hl.bind("mouse:274", function()
    func.drag()
end)
