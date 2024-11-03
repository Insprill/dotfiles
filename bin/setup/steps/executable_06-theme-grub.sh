#!/bin/bash

echo "Setting GRUB theme"
CLONE_DIR="catppuccin-grub"

if ! git clone https://github.com/catppuccin/grub.git $CLONE_DIR; then
    echo "Error: Failed to clone GRUB theme!"
    exit 1
fi

if ! sudo cp -r $CLONE_DIR/src/* /usr/share/grub/themes/; then
    echo "Error: Failed to copy GRUB theme!"
    exit 1
fi

if ! rm -rf $CLONE_DIR; then
    echo "Error: Failed to delete GRUB theme repo at '$(pwd)/$CLONE_DIR'! You'll have to manually delete it."
fi

if ! grep -q '^GRUB_THEME=' /etc/default/grub; then
    if ! echo "GRUB_THEME=/usr/share/grub/themes/catppuccin-mocha-grub-theme/theme.txt" | sudo tee -a /etc/default/grub; then
        echo "Error: Failed to set GRUB theme!"
        exit 1
    fi
fi
