#!/bin/bash

CONFIG_FILE="/etc/mkinitcpio.conf"

echo "Checking for MODULES_DECOMPRESS setting in mkinitcpio.conf"
if grep -q "^[^#]*MODULES_DECOMPRESS=\"yes\"" "$CONFIG_FILE"; then
  echo "MODULES_DECOMPRESS is already set to \"yes\" in $CONFIG_FILE"
else
  if grep -q "^#.*MODULES_DECOMPRESS=" "$CONFIG_FILE"; then
    sudo sed -i '/^#.*MODULES_DECOMPRESS=/ s/^#.*MODULES_DECOMPRESS=.*/MODULES_DECOMPRESS="yes"/' "$CONFIG_FILE"
    echo "Uncommented and set MODULES_DECOMPRESS=\"yes\" in $CONFIG_FILE"
  else
    echo 'MODULES_DECOMPRESS="yes"' | sudo tee -a "$CONFIG_FILE" > /dev/null
    echo "Added MODULES_DECOMPRESS=\"yes\" to $CONFIG_FILE"
  fi

  if grep -q "^[^#]*MODULES_DECOMPRESS=\"yes\"" "$CONFIG_FILE"; then
    echo "Successfully set MODULES_DECOMPRESS=\"yes\" in $CONFIG_FILE"
  else
    echo "Warning: failed to set MODULES_DECOMPRESS=\"yes\"!"
  fi
fi
