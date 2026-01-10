#!/bin/bash

echo "Setting Limine theme"
if ! sudo tee /boot/efi/limine.conf > /dev/null << EOL
### Read more at config document: https://codeberg.org/Limine/Limine/src/branch/v10.x/CONFIG.md

timeout: 3
default_entry: 2
remember_last_entry: yes
hash_mismatch_panic: no

### Theme
interface_branding:
term_palette: 1e1e2e;f38ba8;a6e3a1;f9e2af;89b4fa;f5c2e7;94e2d5;cdd6f4
term_palette_bright: 585b70;f38ba8;a6e3a1;f9e2af;89b4fa;f5c2e7;94e2d5;cdd6f4
term_background: 1e1e2e
term_foreground: cdd6f4
term_background_bright: 585b70
term_foreground_bright: cdd6f4

EOL
then
    echo "Error: Failed to set Limine theme!"
    exit 1
fi

echo "Adding Linux to Limine"
if ! sudo limine-mkinitcpio; then
    echo "Error: Failed to add Linux to Limine!"
    exit 1
fi

echo "Adding other operating systems to Limine. Follow the instructions."
if ! sudo limine-scan; then
    echo "Warning: Failed to add other operating systems to Limine!"
fi

echo "Updating the Limine config"
if ! sudo limine-update; then
    echo "Error: Failed to update Limine config!"
    exit 1
fi
