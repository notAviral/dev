--- Windows ---

local mainMod = require("modules.options").mainMod
local float = require("modules.functions.functions").float

-- Window Actions :
hl.bind("ALT" .. " + F4", hl.dsp.window.close())
hl.bind("ALT" .. " + TAB", hl.dsp.focus({ last = true }))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + F", function() float("toggle") end)
hl.bind(mainMod .. " + up", function() float("enable") end)
hl.bind(mainMod .. " + down", function() float("disable") end)
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit")) -- dwindle only

hl.bind(mainMod .. " + ALT" .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT" .. " + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT" .. " + J", hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT" .. " + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT" .. " + L", hl.dsp.window.swap({ direction = "right" }))

hl.bind(mainMod .. " + P", hl.dsp.window.pin())
