--- Programs ---

local Programs = {
	terminal = "ghostty",
	fileManager = "nautilus",
	menu = "pgrep rofi >/dev/null 2>&1 && killall rofi || rofi -show drun",
	blueman = "blueman-manager",
}

Programs.termManager = Programs.terminal .. " -e yazi"

return Programs
