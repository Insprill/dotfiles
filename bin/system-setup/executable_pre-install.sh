 #!/bin/bash

echo "Adding the Chaotic AUR to Pacman"
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

PACMAN_REPO="[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist"
if ! grep -q "\[chaotic-aur\]" /etc/pacman.conf; then
    echo -e "\n$PACMAN_REPO" | sudo tee -a /etc/pacman.conf
fi

sudo pacman -Syu
