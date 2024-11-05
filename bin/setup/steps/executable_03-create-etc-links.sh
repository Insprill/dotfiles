#!/bin/bash

echo "Linking /etc files"
SRC="$HOME/bin/setup/etc"

# Pacman hooks
sudo mkdir -p /etc/pacman.d/hooks/
sudo ln -s "$SRC/pacman.d/hooks/vencord-pre.hook" /etc/pacman.d/hooks/vencord-pre.hook
sudo ln -s "$SRC/pacman.d/hooks/vencord-post.hook" /etc/pacman.d/hooks/vencord-post.hook

# Polkit rules
sudo mkdir -p /etc/polkit-1/rules.d/
sudo ln -s "$SRC/polkit-1/rules.d/10-power-management.rules" /etc/polkit-1/rules.d/10-power-management.rules

# X11 settings
sudo mkdir -p /etc/X11/xorg.conf.d/
sudo ln -s "$SRC/X11/xorg.conf.d/50-mouse.conf" /etc/X11/xorg.conf.d/50-mouse.conf

# systemctl
sudo mkdir -p /etc/sysctl.d/
sudo ln -s "$SRC/sysctl.d/fs.conf" /etc/sysctl.d/fs.conf

# Sudo
# These can't be linked as sudo requires
# them to be owned by root.
sudo mkdir -p /etc/sudoers.d/
sudo cp "$SRC/sudoers.d/20-insults" /etc/sudoers.d/20-insults

# SDDM
sudo mkdir -p /etc/sddm.conf.d/
sudo ln -s "$SRC/sddm.conf.d/custom-settings.conf" /etc/sddm.conf.d/custom-settings.conf

# Uni-sync
sudo mkdir -p /etc/systemd/system/
sudo ln -s "$SRC/systemd/system/uni-sync.service" /etc/systemd/system/uni-sync.service
sudo ln -s "$SRC/systemd/system/uni-sync.timer" /etc/systemd/system/uni-sync.timer

exit 0
