#!/usr/bin/env bash

# https://github.com/hyprwm/hyprpaper/issues/194#issuecomment-2632115950

WALLPAPER_DIR="$HOME/Pictures/wallpapers/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one (Insprill: limited to image files so Nextcloud sync files don't crash hyprpaper 💀)
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( \
    -iname "*.png" -o \
    -iname "*.jpg" -o \
    -iname "*.jpeg" \
\) ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper reload ,"$WALLPAPER"
