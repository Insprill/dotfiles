#!/bin/bash

echo "Enabling SDDM"
if ! sudo systemctl enable sddm.service; then
    echo "Error: Failed to enable sddm!"
    exit 1
fi
