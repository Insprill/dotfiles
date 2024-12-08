#!/bin/bash

if ! command -v code >/dev/null 2>&1; then
    echo "VSCode is not installed, skipping step"
    exit 0
fi

echo "Setting default Visual Studio Code password store"
JSON_FILE="$HOME/.vscode/argv.json"

key="password-store"
value="gnome"
temp_file="$(mktemp)"

if [ ! -f "$JSON_FILE" ]; then
    mkdir -p "$(dirname "$JSON_FILE")"
    touch "$JSON_FILE"
fi

# Remove comments and save to a temporary file
sed '/^\s*\/\//d' "$JSON_FILE" > "$temp_file"

if [ ! -s "$temp_file" ]; then
    # File is empty after removing comments, create it with initial key-value
    echo "{\"$key\": \"$value\"}" > "$JSON_FILE"
else
    # File exists and is not empty, add or update the key-value
    jq --arg key "$key" --arg value "$value" \
       '.[$key] = $value' "$temp_file" > "$JSON_FILE"
fi

# Clean up
rm "$temp_file"
