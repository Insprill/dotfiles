#!/bin/bash

if [[ $SHELL == *"fish" ]]; then
  echo "Already using fish shell, skipping step"
  exit 0
fi

NEW_SHELL_PATH="/usr/bin/fish"
SHELLS_FILE="/etc/shells"

echo "Changing shell to fish"

# Add fish to the allowed shells file
if ! grep -q "^$NEW_SHELL_PATH$" "$SHELLS_FILE"; then
    if ! echo "$NEW_SHELL_PATH" | sudo tee -a "$SHELLS_FILE"; then
        echo "Error: Failed to add $NEW_SHELL_PATH to $SHELLS_FILE!"
        exit 1
    fi
fi

# Change the shell to fish
if ! chsh -s "$NEW_SHELL_PATH"; then
    echo "Error: Failed to set shell to $NEW_SHELL_PATH"
    exit 1
fi
