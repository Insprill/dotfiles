#!/bin/bash

essentials=(
    "alacritty" # Primary terminal
    "amd-ucode" # AMD CPU microcode
    "archlinux-xdg-menu" # Fix Dolphin file associations
    "ark" # Archive management
    "bat" # cat on steroids
    "bluez" # Bluetooth
    "bluez-utils"
    "blueman" # Bluetooth GUI
    "brightnessctl" # Controll screen brightness
    "btrfs-assistant" # BTRFS management
    "btop" # Resource monitor
    "capitaine-cursors" # Cursor
    "chezmoi" # Dotfile management
    "cmake" # Required to build Hyprland plugins
    "compsize" # View BTRFS compression ratios
    "cpio" # Required to build Hyprland plugins
    "devtools" # Required to edit package files with paru
    "dex" # Autostart desktop files
    "dolphin" # File manager
    "dolphin-plugins" # things 'n stuff
    "dunst" # Notifications
    "dust" # du on crack
    "eza" # ls on crack
    "fastfetch" # New neofetch
    "ffmpegthumbnailer" # Thumbnails in Dolphin
    "fish" # Shell
    "firefox-developer-edition" # W browser
    "gamescope" # Valve magic
    "git"
    "git-lfs"
    "gnome-keyring" # Keyring
    "gnome-themes-extra" # Required for Colloid GTJ theme
    "go" # Required for Neovim's Go LSP
    "gtk-engine-murrine" # Required for Colloid GTK theme
    "hyprland" # Epic compositor
    "hyprlock" # Lockscreen for said epic compositor
    "hyprpolkitagent" # Authentication
    "hyprpicker" # Color picker
    "hyprsysteminfo" # Show system/Hyprland info
    "grimblast-git" # Screenshots
    "icoutils" # Creating desktop files for Wine applications
    "intel-ucode" # Intel CPU microcode
    "iotop" # Disk monitor
    "jq" # Json processing
    "kdegraphics-thumbnailers" # Thumbnails for various files in Dolphin
    "kimageformats" # Thumbnails for avif images in Dolphin (probably others too)
    "kio-admin" # Open folder as admin in Dolphin
    "kitty" # Backup terminal
    "kvantum" # QT6 theme picker
    "kvantum-theme-catppuccin-git" # Catppuccin QT theme
    "kwallet-pam" # Unlock wallet
    "kwalletmanager"
    "layer-shell-qt" # SDDM stuff
    "luarocks" # Neovim config editing
    "libva-utils"
    "localsend" # Epic file sharing between devices
    "meson" # Required to build Hyprland plugins
    "mkinitcpio" # Must be before the kernel
    "mpv" # Video player
    "neovim" # Editor
    "neovide" # Editor but Rust
    "network-manager-applet" # Tray icon for network connectivity
    "nmap" # Network shenanigans
    "nomacs" # Image viewer
    "npm" # Installing Neovim plugins
    "nvtop" # GPU resource monitor (works with AMD, Intel, and Nvidia)
    "nwg-look" # GTK theme picker
    "paccache-hook" # Remove cached versions of old/uninstalled packages
    "packagekit-qt6" # Dolphin plugins
    "pacseek" # Util for looking up packages
    "paru" # AUR helper
    "pavucontrol-qt" # Audio settings
    "pkg-config" # Required to build Hyprland plugins
    "popsicle" # USB flasher
    "python312" # Required for cmake-language-server
    "qdirstat" # WizTree for Linux
    "qt6ct" # QT6 theming
    "qt6-imageformats" # More thumbnails for Dolphin
    "qt6-declarative" # SDDM theme stuff
    "qt6-svg" # More SDDM theme stuff
    "qt6-wayland" # QT6 Wayland support
    "qt5-wayland" # QT5 Wayland support
    "ripgrep" # Grep on cocaine
    "rofi-wayland" # Rofi with Wayland support
    "rofi-calc-git" # Rofi calculator. Must be git, stable doesn't work!
    "sddm" # Display manager
    "sddm-theme-catppuccin-git" # Catppuccin SDDM theme
    "speech-dispatcher" # Used by Firefox and others for text-to-speech
    "starship" # Shell prompt
    "ttf-meslo-nerd" # Fonts
    "ttf-jetbrains-mono-nerd"
    "ttf-nerd-fonts-symbols"
    "ttf-nerd-fonts-symbols-mono"
    "ueberzugpp" # Show images in terminals
    "ungoogled-chromium-bin" # L browser
    "vulkan-tools"
    "vdpauinfo"
    "waybar" # Bar
    "waybar-module-pacman-updates-git" # Show pacman updates in waybar
    "wine-ge-custom" # Better Wine
    "wine-mono" # Mono support for Wine
    "wl-clipboard" # xclip but wayland
    "wlogout" # Power menu
    "wpaperd" # Desktop background picker/randomizer
    "xorg-xeyes" # Useful for debugging XWayland issues
    "xdg-desktop-portal-hyprland"
    "xdg-desktop-portal-gtk"
    "yarn" # Installing Neovim plugins
    "yazi" # W terminal file browser
    "yt-dlp" # we do a little trolling
    "zip"
    "zoxide" # cd on crack
    "7zip" # 7z
)
amdgpu=( # https://wiki.archlinux.org/title/AMDGPU
    "mesa"
    "lib32-mesa"
    "mesa-utils"
    "xf86-video-amdgpu"
    "libva-mesa-driver"
    "lib32-libva-mesa-driver"
    "mesa-vdpau"
    "lib32-mesa-vdpau"
    "rocm-smi-lib" # Let btop access GPU info
    "vulkan-radeon"
    "lib32-vulkan-radeon"
)
development=(
    "docker"
    "docker-buildx"
    "docker-compose"
    "dotnet-sdk" # C#
    "github-cli" # Easy way to login to GitHub with Git
    "jetbrains-toolbox" # IntelliJ/Rider/CLion/Feet
    "lazygit" # Epic git TUI
    "namcap" # Validating PKGBUILDs
    "pnpm" # Better than npm
    "posting" # Terminal API client
    "powershell-bin" # W
    "rustup" # RUUUUST
    "tokei" # Epic line counts
    "visual-studio-code-bin" # Notepad+++
)
gaming=(
    "discord" # 🤓
    "gamemode" # Optimizations for games
    "gpu-screen-recorder-ui" # make a guess
    "lact" # GPU monitoring / overclocking
    "mangohud" # Performance overlay
    "steam" # Good guy Valve
    "steam-native-runtime"
    "proton-ge-custom-bin" # Better Proton
    "protontricks"
    "protonup-qt" # GUI for managing Proton versions
    "xone-dkms-git" # Wired/dongle xbox controller support
    "xpadneo-dkms" # Wireles xbox controller support
)
intelgpu=(
    "mesa"
    "lib32-mesa"
    "mesa-utils"
    "libva-mesa-driver"
    "lib32-libva-mesa-driver"
    "mesa-vdpau"
    "lib32-mesa-vdpau"
    "vulkan-intel"
    "lib32-vulkan-intel"
    "intel-gpu-tools"
)
nvidia=( # https://wiki.archlinux.org/title/NVIDIA
    "nvidia-dkms"
    "nvidia-utils"
    "lib32-nvidia-utils"
    "opencl-nvidia"
    "lib32-opencl-nvidia"
    "libva-nvidia-driver"
)
vr=(
    "avahi" # WiVRn auto-discovery
    "cli11" # OpenComposite dependency
    "glib2-devel" # OpenComposite dependency
    "nlohmann-json" # OpenComposite dependency
    "monado-git" # OpenXR Runtime
    "monado-vulkan-layers-git" # Required for Nvidia (otherwise segfault on launch)
    "envision-xr-git" # Utility for setting up monado/opencomposite/wivrn
    "wlx-overlay-s-git" # Desktop view in VR
)
insprill=( # Stuff I use that I doubt anyone else cares about
    "feishin-bin"
    "thunderbird"
    "unityhub"
    "gconf"
)

groups_list=(
    essentials
    amdgpu
    development
    gaming
    intelgpu
    nvidia
    vr
    insprill
)

dry_run="${1:-false}"
if "$dry_run"; then
    echo "Running in dry run mode - nothing will actually be installed!"
fi

check_install_method() {
    if pacman -Si "$1" &> /dev/null; then
        echo "pacman"
    else
        echo "yay"
    fi
}

install_packages() {
    for pkg in "$@"; do
        install_method=$(check_install_method "$pkg")
        if "$dry_run"; then
            echo "[DRY RUN] Would install $pkg using $install_method."
        else
            echo "Installing $pkg..."
            if pacman -Qi "$pkg" >/dev/null 2>&1; then
                echo "Already installed! Skipping."
            else
                if [ "$install_method" = "pacman" ]; then
                    sudo pacman --noconfirm -S "$pkg"
                else
                    yay --devel --sudoloop --useask --cleanafter --removemake --noconfirm -S "$pkg"
                fi
            fi
        fi
    done
}

display_choices() {
    echo "Available groups to install:"
    for i in "${!groups_list[@]}"; do
        echo "$((i+1))) ${groups_list[i]}"
    done
}

list_group_packages() {
    local group_idx=$(( $1 - 1 ))
    local group_name=${groups_list[$group_idx]}
    local -n group_ref=$group_name
    echo "Packages in $group_name:"
    for pkg in "${group_ref[@]}"; do
        echo "  - $pkg"
    done
}

process_choice() {
    for choice in "$@"; do
        list_group_packages "$choice"
    done

    read -p "Proceed with installation? [y/N]: " -n 1 -r; echo
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
        echo "Updating system..."
        if ! "$dry_run"; then
            sudo pacman -Syu --needed yay --noconfirm # Updates system & ensures yay is installed
            yay -Syu
        fi
        for choice in "$@"; do
            local group_idx=$(( choice - 1 ))
            local group_name=${groups_list[$group_idx]}
            local -n group_ref=$group_name
            echo "Installing $group_name..."
            install_packages "${group_ref[@]}"
        done
    else
        echo "Installation cancelled."
    fi
}

display_choices
read -p "Enter the numbers of the groups you want to install, seperated by spaces: " -r -a input; echo

process_choice "${input[@]}"

echo "Installation complete."
