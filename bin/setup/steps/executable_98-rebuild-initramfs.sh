#!/bin/bash

echo "Rebuilding initramfs"
if ! sudo mkinitcpio -P; then
    echo "Error: Failed to rebuild initramfs!"
    exit 1
fi
