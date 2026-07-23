--- Programs ---

local Programs = {
    terminal = "ghostty",
    fileManager = "nautilus",
    menu = "pgrep rofi >/dev/null 2>&1 && killall rofi || rofi -show drun",
    blueman = "blueman-manager",
    pdfViewer = "zathura",
}

Programs.termManager = Programs.terminal .. " -e yazi"

return Programs
