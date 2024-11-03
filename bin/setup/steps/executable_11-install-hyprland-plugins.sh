#!/bin/bash

if ! command -v hyprpm >/dev/null 2>&1; then
    echo "Hyprland not installed, skipping step"
    exit 0
fi

echo "Updating hyprpm"
if ! hyprpm update; then
    echo "Error: Failed to update hyprpm! Hyprland plugins cannot be installed."
    exit 1
fi

# Per-monitor workspaces
echo "Installing split-monitor-workspaces"
hyprpm add https://github.com/Duckonaut/split-monitor-workspaces
hyprpm enable split-monitor-workspaces
