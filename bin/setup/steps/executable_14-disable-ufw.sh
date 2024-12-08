#!/bin/bash

if ! command -v ufw >/dev/null 2>&1; then
    echo "UFW not installed, skipping step"
    exit 0
fi

echo "Disabling UFW"
sudo ufw disable
