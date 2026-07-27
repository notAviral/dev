--- Programs ---
local Programs       = {}

Programs.terminal    = "ghostty"
Programs.fileManager = "nautilus"
Programs.menu        = "pgrep rofi >/dev/null 2>&1 && killall rofi || rofi -show drun"
Programs.blueman     = "blueman-manager"
Programs.pdfViewer   = "zathura"
Programs.termManager = Programs.terminal .. " -e yazi"

return Programs
