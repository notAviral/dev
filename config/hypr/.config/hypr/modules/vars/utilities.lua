--- Utilities ---

local M = {
    logout =
    "command -v wlogout >/dev/null 2>&1 && wlogout || command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'",
    shutdown = "command -v wlogout >/dev/null 2>&1 && wlogout || systemctl poweroff",

    paste = "cliphist list | " .. require("modules.vars.programs").menu .. " -dmenu | cliphist decode | wl-copy",

    volume = {
        up = "wpctl set-volume -l 2 @DEFAULT_AUDIO_SINK@ 5%+",
        down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
        mute = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
        micMute = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
    },

    player = {
        playPause = "playerctl play-pause",
        next = "playerctl next",
        prev = "playerctl previous",
    },

    screen = {
        brightnessUp = "brightnessctl s 10%+",
        brightnessDown = "brightnessctl s 10%-",
    },

    screenshot = {
        basic = 'grim -g "$(slurp)" - | wl-copy',
        fullscreen = 'grim - | wl-copy',
    }
}
return M
