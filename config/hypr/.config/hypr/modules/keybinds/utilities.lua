--- Utilities ---

local mainMod = require("modules.options").mainMod
local utils = require("modules.vars.utilities")

-- Utilities :
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(utils.paste))
hl.bind(mainMod .. " + ALT" .. " + F4", hl.dsp.exec_cmd(utils.shutdown))
hl.bind(mainMod .. " + ALT" .. " + M", hl.dsp.exec_cmd(utils.logout))

-- Screenshot:
hl.bind("Print", hl.dsp.exec_cmd(utils.screenshot.basic))
hl.bind("CTRL + Print", hl.dsp.exec_cmd(utils.screenshot.fullscreen))
