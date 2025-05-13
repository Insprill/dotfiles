#!/bin/bash

if ! command -v gpu-screen-recorder >/dev/null 2>&1; then
    echo "gpu-screen-recorder not installed, skipping step"
    exit 0
fi
#
# Enable clipping
read -p "Do you want to enable screen recording? [y/N] " -n 1 -r; echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Enabling screen recording. Press ALT+Z to open the overlay and configure settings."
    systemctl enable --now --user gpu-screen-recorder-ui
else
    echo "Disabling screen recording"
    systemctl disable --now --user gpu-screen-recorder-ui
fi
