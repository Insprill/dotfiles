#!/bin/bash

if ! nwg-look -a; then
    echo "Warning: Failed to apply GTK theme. Open 'GTK Settings' (nwg-look) and apply the settings manually."
fi

exit 0
