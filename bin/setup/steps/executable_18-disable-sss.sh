#!/bin/bash

set -euo pipefail

# https://wiki.archlinux.org/title/Improving_performance/Boot_process#Staggered_spin-up
PARAM="libahci.ignore_sss=1"
GRUB_CONFIG=/etc/default/grub

if ! grep -qE "^GRUB_CMDLINE_LINUX(_DEFAULT)?=.*\b${PARAM}\b" "$GRUB_CONFIG"; then
  echo "Disabling staggered spin-up."
  sudo sed -i -r \
    -e "s#^(GRUB_CMDLINE_LINUX(_DEFAULT)?=')([^']*)'#\1\3 ${PARAM}'#" \
    "$GRUB_CONFIG"
else
  echo "Staggered spin-up already disabled, skipping."
fi
