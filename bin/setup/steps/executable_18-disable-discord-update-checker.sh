#!/bin/bash

if ! command -v discord >/dev/null 2>&1; then
    echo "Discord not installed, skipping step"
    exit 0
fi

echo '{"SKIP_HOST_UPDATE": true}' > ~/.config/discord/settings.json
echo "Disabled Discord update checks"
