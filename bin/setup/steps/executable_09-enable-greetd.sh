#!/bin/bash

echo "Enabling greetd"
if ! sudo systemctl enable greetd.service; then
    echo "Error: Failed to enable greetd!"
    exit 1
fi
