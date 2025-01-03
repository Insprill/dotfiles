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
    echo "If you want to disable it later, comment the startup line in '$HYPRLAND_CONFIG'."
else
    echo "Disabling clipping"
    if ! sed -i "s|^exec-once = ~/bin/start_gpu_recorder_replay.sh|# exec-once = ~/bin/start_gpu_recorder_replay.sh|" "$HYPRLAND_CONFIG"; then
        echo "Warning: Failed to disable clipping. You can do so manually in '$HYPRLAND_CONFIG'."
    fi
fi
