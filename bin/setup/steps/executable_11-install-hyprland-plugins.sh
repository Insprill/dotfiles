#!/bin/bash

PLUGINS_DIR="$HOME/.config/hypr/plugins"
mkdir -p "$PLUGINS_DIR"

# Per-monitor workspaces
echo "Installing split-monitor-workspaces"
if ! git clone https://github.com/zjeffer/split-monitor-workspaces "$PLUGINS_DIR/split-monitor-workspaces"; then
    echo "Error: Failed to clone split-monitor-workspaces!"
    exit 1
fi
