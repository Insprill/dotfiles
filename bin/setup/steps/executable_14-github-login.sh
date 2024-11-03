#!/bin/bash

if ! command -v gh >/dev/null 2>&1; then
    echo "GitHub CLI not installed, skipping step"
    exit 0
fi

if gh auth | grep 'Logged in' >/dev/null 2>&1; then
    echo "Already logged into GitHub, skipping"
    exit 0
fi

echo "Logging into GitHub"
bash -c gh auth login
