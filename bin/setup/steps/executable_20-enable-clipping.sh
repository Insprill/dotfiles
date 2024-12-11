#!/bin/bash

if ! command -v gpu-screen-recorder >/dev/null 2>&1; then
    echo "gpu-screen-recorder not installed, skipping step"
    exit 0
fi
#
# Enable clipping
read -p "Do you want to enable clipping? [y/N] " -n 1 -r; echo

HYPRLAND_CONFIG="$HOME/.config/hypr/hyprland.conf"

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Enabling clipping"
    if ! sed -i "s|^# exec-once = ~/bin/start_gpu_recorder_replay.sh|exec-once = ~/bin/start_gpu_recorder_replay.sh|" "$HYPRLAND_CONFIG"; then
        echo "Warning: Failed to enable clipping. You can do so manually in '$HYPRLAND_CONFIG'."
    fi
else
    echo "If you want to enable it later, uncomment the startup line in '$HYPRLAND_CONFIG'."
fi
