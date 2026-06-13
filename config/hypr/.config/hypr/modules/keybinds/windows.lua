--- Windows ---

local mainMod = require("modules.options").mainMod

-- Window Actions :
hl.bind("ALT" .. " + F4", hl.dsp.window.close())
hl.bind("ALT" .. " + TAB", hl.dsp.focus({ last = true }))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + up", hl.dsp.window.float({ action = "enable" }))
hl.bind(mainMod .. " + down", hl.dsp.window.float({ action = "disable" }))
hl.bind(mainMod .. " + T", hl.dsp.layout("togglesplit")) -- dwindle only

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind("ALT" .. " + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind("ALT" .. " + J", hl.dsp.window.swap({ direction = "down" }))
hl.bind("ALT" .. " + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind("ALT" .. " + L", hl.dsp.window.swap({ direction = "right" }))

hl.bind(mainMod .. " + P", hl.dsp.window.pin())
