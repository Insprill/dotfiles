#!/bin/bash

delete_empty_dir() {
    local dir="$1"

    if [ -d "$dir" ]; then
        if [ -z "$(ls -A "$dir")" ]; then
            echo "Deleting '$dir'..."
            rm -r "$dir"
        else
            echo "'$dir' is not empty! Skipping deletion."
        fi
    fi
}

delete_empty_dir "$HOME/Desktop"
delete_empty_dir "$HOME/Public"
delete_empty_dir "$HOME/Templates"
