#!/bin/bash

# Set the system clock to local time instead of UTC.
# This fixes time issues when dual booting Windows, since
# it always expects sys time to be local.
if ! timedatectl set-local-rtc 1 --adjust-system-clock; then
    echo "Error: Failed to set system clock to local time! If you're dual booting windows, expect time issues!"
fi
