#!/usr/bin/env bash

# https://github.com/hyprwm/hyprpaper/issues/194#issuecomment-2632115950

WALLPAPER_DIR="$HOME/Pictures/wallpapers/"

# Get a random wallpaper that is not the current one (Insprill: limited to image files so Nextcloud sync files don't crash hyprpaper 💀)
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( \
    -iname "*.png" -o \
    -iname "*.jpg" -o \
    -iname "*.jpeg" \
\) | shuf -n 1)

# Apply the selected wallpaper
for i in $(hyprctl monitors | awk '/^Monitor / {print $2}');
do
    hyprctl hyprpaper wallpaper $i,"$WALLPAPER"
done
