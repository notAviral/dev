#!/bin/bash

WALLPAPER="$1"

# using swww to change the wallpaper :
if ! pgrep -x swww-daemon > /dev/null; then
    echo "swww daemon not running!!"
    echo "initialising swww-daemon"
    swww-daemon &
    sleep 1
fi
swww img "$WALLPAPER"

# using matugen to generate colors : 
matugen image "$WALLPAPER"
