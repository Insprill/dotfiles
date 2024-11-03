#!/bin/bash

# Rebuild bat cache (update themes)
echo "Rebuilding bat cache"
if ! bat cache --build; then
    echo "Error: Failed to rebuild bat cache! bat theming may be broken."
fi
