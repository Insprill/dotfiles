#!/bin/bash

read -p "Do you have an Nvidia GPU? [y/N] " -n 1 -r; echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Skipping Nvidia GPU setup"
    exit 0
fi

echo "Adding Kernel modules"
NVIDIA_KERNEL_MODULES="nvidia nvidia_modeset nvidia_uvm nvidia_drm"
if ! grep -q "$NVIDIA_KERNEL_MODULES" /etc/mkinitcpio.conf || sudo sed -i "/^MODULES=/s/)/ $NVIDIA_KERNEL_MODULES)/" /etc/mkinitcpio.conf; then
    echo "Error: Failed to update /etc/mkinitcpio.conf"
    exit 1
fi
