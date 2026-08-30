#!/bin/bash

echo "Linking /etc files"
SRC="$HOME/bin/setup/etc"
DEST_BASE="/etc"

create_dir() {
    local dir="$DEST_BASE/$(dirname "$1")"
    if [ ! -d "$dir" ]; then
        echo "Creating directory: $dir"
        sudo mkdir -p "$dir"
    fi
}

create_symlink() {
    local src="$SRC/$1"
    local dest="$DEST_BASE/$1"
    create_dir "$1"
    echo "Creating link '$dest'"
    sudo rm "$dest"
    sudo ln -s "$src" "$dest"
}

copy_file() {
    local src="$SRC/$1"
    local dest="$DEST_BASE/$1"
    create_dir "$1"
    echo "Copying file '$dest'"
    sudo rm "$dest"
    sudo cp "$src" "$dest"
}

# greetd
copy_file "pam.d/greetd"

# Modprobe
create_symlink "modprobe.d/nvidia.conf"

# Modules
copy_file "modules-load.d/ntsync.conf"

# Polkit rules
create_symlink "polkit-1/rules.d/10-power-management.rules"

# Security
copy_file "security/limits.conf"

# Sysctl
copy_file "sysctl.d/99-fs.conf"

# Systemd Services
copy_file "systemd/system/x3d-cache-mode.service"

# Sudo (cannot be linked, must be copied)
copy_file "sudoers.d/20-insults"

# Udev rules
create_symlink "udev/rules.d/60-ioschedulers.rules"
create_symlink "udev/rules.d/99-8bitdo-xinput.rules"

# X11 settings
create_symlink "X11/xorg.conf.d/50-mouse.conf"

# Noctalia Greeter (not etc but close enough)
sudo rm /var/lib/noctalia-greeter/greeter.toml
sudo cp -r $HOME/bin/setup/varlib/noctalia-greeter/greeter.toml /var/lib/noctalia-greeter/greeter.toml

exit 0
