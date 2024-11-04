#!/bin/bash

essentials=(
    "alacritty-git" # Primary terminal
    "amd-ucode" # AMD CPU microcode
    "bat" # cat on steroids
    "beautyline" # Icon
    "bluez" # Bluetooth
    "bluez-utils"
    "brightnessctl" # Controll screen brightness
    "btrfs-assistant" # BTRFS management
    "btop" # Resource monitor
    "catppuccin-gtk-theme-mocha" # Catppuccin GTK theme (deprecated :pain:)
    "chezmoi" # Dotfile management
    "compsize" # View BTRFS compression ratios
    "devtools" # Required to edit package files with paru
    "dex" # Autostart desktop files
    "dolphin" # File manager
    "dunst" # Notifications
    "dust" # du on crack
    "eza" # ls on crack
    "fastfetch" # New neofetch
    "fish" # Shell
    "firefox-developer-edition" # W browser
    "flameshot" # X screenshots
    "gcolor3" # Color picker
    "git"
    "git-lfs"
    "gnome-keyring" # Keyring
    "icoutils" # Creating desktop files for Wine applications
    "intel-ucode" # Intel CPU microcode
    "iotop" # Disk monitor
    "jq" # Json processing
    "kitty" # Backup terminal
    "kvantum" # QT6 theme picker
    "kvantum-theme-catppuccin-git" # Catppuccin QT theme
    "kwallet-pam" # Unlock wallet
    "kwalletmanager"
    "mkinitcpio" # Must be before the kernel
    "linux-zen" # W kernel
    "linux-zen-headers" # W kernel headers
    "libva-utils"
    "neovim" # Editor
    "neovide" # Editor but Rust
    "nerd-fonts-git" # Fonts
    "network-manager-applet" # Tray icon for network connectivity
    "nmap" # Network shenanigans
    "nomacs" # Image viewer
    "nvtop" # GPU resource monitor (works with AMD, Intel, and Nvidia)
    "nwg-look" # GTK theme picker
    "p7zip" # 7z
    "pacseek" # Util for looking up packages
    "paru" # AUR helper
    "pavucontrol" # Audio settings
    "polkit-kde-agent" # Authentication
    "popsicle" # USB flasher
    "qt6ct" # QT6 theming
    "qt6-declarative" # SDDM theme stuff
    "qt6-svg" # More SDDM theme stuff
    "ripgrep" # Grep on cocaine
    "rofi-wayland" # Rofi with Wayland support
    "rofi-calc-git" # Rofi calculator
    "sddm" # Display manager
    "sddm-theme-catppuccin-git" # Catppuccin SDDM theme
    "speech-dispatcher" # Used by Firefox and others for text-to-speech
    "starship" # Shell prompt
    "capitaine-cursors" # Cursor
    "ueberzugpp" # Show images in terminals
    "ungoogled-chromium" # L browser
    "vulkan-tools"
    "vdpauinfo"
    "wine-ge-custom" # Better Wine
    "wine-mono" # Mono support for Wine
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
    "luarocks" # Neovim config editing
    "namcap" # Validating PKGBUILDs
    "npm" # Installing Neovim plugins
    "pnpm" # Better than npm
    "posting" # Terminal API client
    "powershell-bin" # W
    "rustup" # RUUUUST
    "tokei" # Epic line counts
    "visual-studio-code-bin" # Notepad+++
    "yarn" # Worse than pnpm
)
gaming=(
    "discord" # 🤓
    "gamemode" # Optimizations for games
    "gpu-screen-recorder-gtk-git" # Basically shadowplay
    "mangohud" # Performance overlay
    "steam" # Good guy Valve
    "steam-native-runtime"
    "proton-ge-custom-bin" # Better Proton
    "protonup-qt" # GUI for managing Proton versions
    "xpadneo-dkms-git" # Wireles xbox controller support
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
intelintegrated_10th_or_older=(
    "mesa-amber"
    "lib32-mesa-amber"
    "mesa-utils"
    "libva-mesa-driver"
    "lib32-libva-mesa-driver"
    "mesa-vdpau"
    "lib32-mesa-vdpau"
    "xf86-video-intel"
    "vulkan-intel"
    "lib32-vulkan-intel"
    "intel-gpu-tools"
)
i3=(
    "arandr" # Monitor config
    "i3" # Window manager
    "i3lock-fancy-rapid-git" # Pretty lock screen
    "i3status-rust-git" # RUUUUST
    "feh" # Desktop background
    "numlockx" # Enable numlock
    "picom-git" # X compositor
    "conky" # X system stats
    "meson" # Required to build i3
    "ninja" # Required to build i3
    "xclip" # Clipboard stuff
    "xorg-xev" # Keybind debugging
)
nvidia=( # https://wiki.archlinux.org/title/NVIDIA
    "nvidia-dkms"
    "nvidia-settings"
    "nvidia-utils"
    "lib32-nvidia-utils"
    "opencl-nvidia"
    "lib32-opencl-nvidia"
    "libva-nvidia-driver-git"
)
hyprland=( # https://wiki.hyprland.org/Useful-Utilities/
    "cmake" # Required to build plugins
    "cpio" # Required to build plugins
    "hyprutils-git"
    "hyprlang-git"
    "hyprcursor-git"
    "hyprwayland-scanner-git"
    "aquamarine-git"
    "hyprland-git" # Based (above are required otherwise hyprland-git sometimes won't build)
    "hyprlock-git"
    "gamescope" # Valve magic
    "grimblast-git" # Screenshots
    "hyprpicker" # Color picker
    "qt5-wayland" # QT5 Wayland support
    "qt6-wayland" # QT6 Wayland support
    "meson" # Required to build plugins
    "waybar-git"
    "wl-clipboard" # xclip but wayland
    "waypaper" # Desktop background
    "wlogout" # Power menu
    "xdg-desktop-portal-hyprland-git"
    "xdg-desktop-portal-gtk"
    "xorg-xeyes" # Useful for debugging XWayland issues
    "xorg-xhost" # Fixes GParted not opening
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
    intelintegrated_10th_or_older
    i3
    nvidia
    hyprland
    insprill
)

dry_run=$1

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
            if [ "$install_method" = "pacman" ]; then
                sudo pacinstall --yolo "$pkg"
            else
                yay --devel --sudoloop --useask --cleanafter --noconfirm -S "$pkg"
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
            sudo pacman -Syu --needed yay # Updates system & ensures yay is installed
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
