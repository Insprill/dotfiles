#!/bin/bash

essentials=(
    "alacritty" # Primary terminal
    "amd-ucode" # AMD CPU microcode
    "ark" # Archive management
    "bat" # cat on steroids
    "bluez" # Bluetooth
    "bluez-utils"
    "blueman" # Bluetooth GUI
    "brightnessctl" # Controll screen brightness
    "btrfs-assistant" # BTRFS management
    "btop" # Resource monitor
    "capitaine-cursors" # Cursor
    "catppuccin-gtk-theme-mocha" # Catppuccin GTK theme (deprecated :pain:)
    "chezmoi" # Dotfile management
    "compsize" # View BTRFS compression ratios
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
    "flameshot" # X screenshots
    "git"
    "git-lfs"
    "gnome-keyring" # Keyring
    "icoutils" # Creating desktop files for Wine applications
    "intel-ucode" # Intel CPU microcode
    "iotop" # Disk monitor
    "jq" # Json processing
    "kdegraphics-thumbnailers" # Thumbnails for various files in Dolphin
    "kio-admin" # Open folder as admin in Dolphin
    "kitty" # Backup terminal
    "kvantum" # QT6 theme picker
    "kvantum-theme-catppuccin-git" # Catppuccin QT theme
    "kwallet-pam" # Unlock wallet
    "kwalletmanager"
    "luarocks" # Neovim config editing
    "mkinitcpio" # Must be before the kernel
    "libva-utils"
    "localsend" # Epic file sharing between devices
    "mpv" # Video player
    "neovim" # Editor
    "neovide" # Editor but Rust
    "network-manager-applet" # Tray icon for network connectivity
    "nmap" # Network shenanigans
    "nomacs" # Image viewer
    "npm" # Installing Neovim plugins
    "nvtop" # GPU resource monitor (works with AMD, Intel, and Nvidia)
    "nwg-look" # GTK theme picker
    "p7zip" # 7z
    "packagekit-qt6" # Dolphin plugins
    "pacseek" # Util for looking up packages
    "paru" # AUR helper
    "pavucontrol-qt" # Audio settings
    "popsicle" # USB flasher
    "qdirstat" # WizTree for Linux
    "qt6ct" # QT6 theming
    "qt6-imageformats" # More thumbnails for Dolphin
    "qt6-declarative" # SDDM theme stuff
    "qt6-svg" # More SDDM theme stuff
    "ripgrep" # Grep on cocaine
    "rofi-wayland" # Rofi with Wayland support
    "rofi-calc" # Rofi calculator
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
    "wine-ge-custom" # Better Wine
    "wine-mono" # Mono support for Wine
    "yarn" # Installing Neovim plugins
    "yazi" # W terminal file browser
    "yt-dlp" # we do a little trolling
    "zip"
    "zoxide" # cd on crack
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
    "go" # Inferior to Rust
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
    "gpu-screen-recorder" # make a guess
    "mangohud" # Performance overlay
    "steam" # Good guy Valve
    "steam-native-runtime"
    "proton-ge-custom-bin" # Better Proton
    "protontricks"
    "protonup-qt" # GUI for managing Proton versions
    "xone-dkms" # Wired/dongle xbox controller support
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
hyprland=( # https://wiki.hyprland.org/Useful-Utilities/
    "cmake" # Required to build plugins
    "cpio" # Required to build plugins
    "hyprland" # Epic compositor
    "hyprlock" # Lockscreen for said epic compositor
    "hyprpolkitagent" # Authentication
    "gamescope" # Valve magic
    "grimblast-git" # Screenshots
    "hyprpaper" # Desktop background
    "hyprpicker" # Color picker
    "hyprsysteminfo" # Show system/Hyprland info
    "layer-shell-qt" # SDDM stuff
    "layer-shell-qt5" # SDDM stuff
    "pkg-config" # Required to build plugins
    "qt5-wayland" # QT5 Wayland support
    "qt6-wayland" # QT6 Wayland support
    "meson" # Required to build plugins
    "waybar" # Bar
    "waybar-module-pacman-updates-git" # Show pacman updates in waybar
    "wl-clipboard" # xclip but wayland
    "waypaper" # Desktop background picker/randomizer
    "wlogout" # Power menu
    "xdg-desktop-portal-hyprland"
    "xdg-desktop-portal-gtk"
    "xorg-xeyes" # Useful for debugging XWayland issues
    "xorg-xhost" # Fixes GParted not opening
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
    "spek"
    "thunderbird"
    "unityhub"
    "gconf" # Required for Unity to work
    "vesktop-bin"
)

groups_list=(
    essentials
    amdgpu
    development
    gaming
    intelgpu
    nvidia
    hyprland
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
                    sudo pacinstall --yolo "$pkg"
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
