#!/bin/bash

read -p "Reboot system? [y/N]: " -n 1 -r; echo

if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    sudo reboot
fi
