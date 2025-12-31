#!/bin/bash

read -p "Do you have an Nvidia GPU? [y/N] " -n 1 -r; echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Skipping Nvidia GPU setup"
    exit 0
fi

NVIDIA_KERNEL_MODULES="nvidia nvidia_modeset nvidia_uvm nvidia_drm"
if grep -q "$NVIDIA_KERNEL_MODULES" /etc/mkinitcpio.conf; then
    echo "Nvidia kernel modules already added; skipping."
else
    echo "Adding Kernel modules"
    if ! sudo sed -i "/^MODULES=/s/)/ $NVIDIA_KERNEL_MODULES)/" /etc/mkinitcpio.conf; then
        echo "Error: Failed to update /etc/mkinitcpio.conf"
        exit 1
    fi
fi

echo "Enabling Nvidia-specific Hyprland options"
sed -i "s|^# source=./land/nvidia.conf|source=./land/nvidia.conf|" "$HOME/.config/hypr/hyprland.conf"

exit 0

