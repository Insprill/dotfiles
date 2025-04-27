#!/bin/bash

CONFIG_FILE="/etc/mkinitcpio.conf"

echo "Replacing base and udev mkinitcpio hooks with systemd"
sudo sed -i '/^[^#]*HOOKS=/ s/\(HOOKS=.*\)base udev\(.*\)/\1systemd\2/g' "$CONFIG_FILE"

if grep -q "^[^#]*HOOKS.*systemd" "$CONFIG_FILE"; then
  echo "Successfully replaced 'base udev' with 'systemd' in $CONFIG_FILE"
else
  echo "Warning: failed to replace base and udev hooks with systemd!"
fi
