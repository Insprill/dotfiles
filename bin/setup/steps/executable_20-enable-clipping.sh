#!/bin/bash

if ! command -v gpu-screen-recorder >/dev/null 2>&1; then
    echo "gpu-screen-recorder not installed, skipping step"
    exit 0
fi
#
# Enable clipping
read -p "Do you want to enable clipping? [y/N] " -n 1 -r; echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    systemctl --user enable gpu-screen-recorder-replay.service
    systemctl --user start gpu-screen-recorder-replay.service
else
    echo "If you want to enable it later, start the 'gpu-screen-recorder-replay' user service."
fi
