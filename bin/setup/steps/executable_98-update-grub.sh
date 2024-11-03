#!/bin/bash

# Update GRUB config (theme, microcode)
echo "Updating the GRUB config"
if ! sudo grub-mkconfig -o /boot/grub/grub.cfg; then
    echo "Error: Failed to update grub config!"
    exit 1
fi
