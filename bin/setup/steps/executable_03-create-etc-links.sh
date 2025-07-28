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

# Hyprland (linking breaks sddm)
copy_file "hyprland/common.conf"
copy_file "hyprland/monitors.conf"
copy_file "hyprland/nvidia.conf"
copy_file "hyprland/theme.conf"

# Modprobe
create_symlink "modprobe.d/nvidia.conf"

# Modules
copy_file "modules-load.d/ntsync.conf"

# Pacman hooks
create_symlink "pacman.d/hooks/hyprland-post.hook"
create_symlink "pacman.d/hooks/vencord-pre.hook"
create_symlink "pacman.d/hooks/vencord-post.hook"

# Polkit rules
create_symlink "polkit-1/rules.d/10-power-management.rules"

# Security
copy_file "security/limits.conf"

# Sysctl
copy_file "sysctl.d/99-fs.conf"

# Sudo (cannot be linked, must be copied)
copy_file "sudoers.d/20-insults"

# SDDM
create_symlink "sddm.conf.d/custom-settings.conf"

# X11 settings
create_symlink "X11/xorg.conf.d/50-mouse.conf"

exit 0
