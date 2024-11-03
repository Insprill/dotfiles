#!/bin/bash

read -p "Do you have an AMD GPU? [y/N] " -n 1 -r; echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Skipping AMD GPU setup"
    exit 0
fi

echo "Enabling overclocking support"
if ! echo "options amdgpu ppfeaturemask=0xffffffff" | sudo tee /usr/lib/modprobe.d/amdoverclocking.conf > /dev/null; then
    echo "Error: Failed to write overclocking config"
    exit 1
fi

echo "Adding Kernel module"
if ! grep -q 'amdgpu' /etc/mkinitcpio.conf; then
    if ! sudo sed -i '/^MODULES=/s/)/ amdgpu)/' /etc/mkinitcpio.conf; then
        echo "Error: Failed to update /etc/mkinitcpio.conf"
        exit 1
    fi
fi
