-- Events

local startup = {
    "quickshell -c athena",
    "hyprpaper",
    "swaync",
}

local config_update = {
    "hyprpaper",
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
