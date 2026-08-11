--- Utilities ---
local Utilities = {}

Utilities.logout =
"command -v wlogout >/dev/null 2>&1 && wlogout || command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"

Utilities.shutdown = "command -v wlogout >/dev/null 2>&1 && wlogout || systemctl poweroff"

Utilities.paste = "cliphist list | " .. require("modules.vars.programs").menu .. " -dmenu | cliphist decode | wl-copy"

Utilities.volume = {
    up = "wpctl set-volume -l 2 @DEFAULT_AUDIO_SINK@ 5%+",
    down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
    mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
    micMute = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
}

Utilities.player = {
    playPause = "playerctl play-pause",
    next = "playerctl next",
    prev = "playerctl previous",
}

Utilities.screen = {
    brightnessUp = "brightnessctl s 10%+",
    brightnessDown = "brightnessctl s 10%-",
}

Utilities.screenshot = {
    basic = 'grim -g "$(slurp)" - | wl-copy',
    fullscreen = 'grim - | wl-copy',
}

return Utilities
