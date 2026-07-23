--- Programs ---

local mainMod = require("modules.options").mainMod
local program = require("modules.vars.programs")

-- Programs
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(program.menu))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(program.terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(program.fileManager))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(program.termManager))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd(program.pdfViewer))
hl.bind(mainMod .. " + ALT" .. " + B", hl.dsp.exec_cmd(program.blueman))
