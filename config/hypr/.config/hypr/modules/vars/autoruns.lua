local autorun = {}

autorun.bar = "quickshell -c athena"
autorun.wallpaper = "hyprpaper"
autorun.nofication = "swaync"
autorun.kanata = {
    on = "/usr/bin/kanata -c ~/.config/kanata/config.kbd",
    restart = "pkill kanata && /usr/bin/kanata -c ~/.config/kanata/config.kbd"
}
autorun.polkit = "/usr/lib/polkit-kde-authentication-agent-1"

return autorun
