-- Events
local autorun = require("modules.vars.autoruns")

local startup = {
    autorun.bar,
    autorun.wallpaper,
    autorun.notification,
}

local config_update = {
    autorun.wallpaper,
}

-- Triggers
hl.on("hyprland.start", function()
    for _, cmd in ipairs(startup) do
        hl.exec_cmd(cmd)
    end
end)

hl.on("config.reloaded", function()
    for _, cmd in ipairs(config_update) do
        hl.exec_cmd("pkill " .. cmd .. "; " .. cmd)
    end
end)
