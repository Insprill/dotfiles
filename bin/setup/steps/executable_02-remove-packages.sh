#!/bin/bash

packages=(
    dracut # Comes with EndeavourosOS, we use mkinitcpio
    eos-dracut
    xterm # Comes with EndeavourosOS
    pavucontrol # We use pavucontrol-qt
)

for pkg in "${packages[@]}"; do
    if pacman -Qi "$pkg" >/dev/null 2>&1; then
        echo "Uninstalling $pkg"
        if ! sudo pacman -Rdd --noconfirm "$pkg"; then
            echo "Error: Failed to uninstall $pkg!"
            exit 1
        fi
    fi
done
