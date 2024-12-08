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
if ! sudo sed -i "s|^# source=/etc/hyprland/nvidia.conf|source=/etc/hyprland/nvidia.conf|" /etc/hyprland/common.conf; then
    echo "Warning: Failed to enable Nvidia Hyprland options. Are they already enabled?"
fi

exit 0

