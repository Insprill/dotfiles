#!/bin/bash

essentials=(
    "yay" # Must be first
    "alacritty-git" # Primary terminal
    "bat" # cat on steroids
    "beautyline" # Icon
    "bluez" # Bluetooth
    "bluez-utils"
    "btrfs-assistant" # BTRFS management
    "btop" # Resource monitor
    "chezmoi" # Dotfile management
    "compsize" # View BTRFS compression ratios
    "devtools" # Required to edit package files with paru
    "dex" # Autostart desktop files
    "dolphin" # File manager
    "dunst" # Notifications
    "dust" # du on crack
    "eza" # ls on crack
    "fish" # Shell
    "firefox-developer-edition" # W browser
    "flameshot" # X screenshots
    "gcolor3" # Color picker
    "gnome-keyring" # Keyring
    "icoutils" # Creating desktop files for Wine applications
    "iotop" # Disk monitor
    "jq" # Json processing
    "kitty" # Backup terminal
    "kvantum" # QT6 theme picker
    "kwallet-pam" # Unlock wallet
    "kwalletmanager"
    "mkinitcpio" # Must be before the kernel
    "linux-zen" # W kernel
    "linux-zen-headers" # W kernel headers
    "libva-utils"
    "neofetch"
    "neovim" # Editor
    "neovide" # Editor but Rust
    "nerd-fonts-git" # Fonts
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
    "qt5ct" # QT5 theming
    "qt5-graphicaleffects" # SDDM theme stuff
    "qt5-svg" # More SDDM theme stuff
    "qt5-quickcontrols2" # Guess what? Even more SDDM theme stuff!
    "ripgrep" # Grep on cocaine
    "rofi-wayland" # Rofi with Wayland support
    "rofi-calc-git" # Rofi calculator
    "sddm" # Display manager
    "speech-dispatcher" # Used by Firefox and others for text-to-speech
    "starship" # Shell prompt
    "capitaine-cursors" # Cursor
    "ueberzugpp" # Show images in terminals
    "ungoogled-chromium" # L browser
    "vulkan-tools"
    "vdpauinfo"
    "wine-ge-custom" # Better Wine
    "wine-mono" # Mono support for Wine
    "winetricks"
    "yazi" # W terminal file browser
    "yt-dlp" # we do a little trolling
    "zip"
    "zoxide" # cd on crack
)
amdcpu=( # https://wiki.archlinux.org/title/Ryzen
    "amd-ucode"
)
amdgpu=( # https://wiki.archlinux.org/title/AMDGPU
    "mesa"
    "lib32-mesa"
    "xf86-video-amdgpu"
    "libva-mesa-driver"
    "lib32-libva-mesa-driver"
    "mesa-vdpau"
    "lib32-mesa-vdpau"
    "rocm-smi-lib" # Let btop access GPU info
    "vulkan-radeon"
    "lib32-vulkan-radeon"
)
catppuccin=(
    "catppuccin-gtk-theme-mocha"
    "catppuccin-cursors-mocha"
    "kvantum-theme-catppuccin-git"
    "sddm-theme-catppuccin-git"
)
development=(
    "docker"
    "docker-buildx"
    "docker-compose"
    "dotnet-sdk" # C#
    "github-cli" # Easy way to login to GitHub with Git
    "git"
    "git-lfs"
    "go" # Inferior to Rust
    "jetbrains-toolbox" # IntelliJ/Rider/CLion/Feet
    "luarocks" # Neovim config editing
    "namcap" # Validating PKGBUILDs
    "npm" # Installing Neovim plugins
    "pnpm" # Better than npm
    "powershell-bin" # W
    "rustup" # RUUUUST
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
    "protontricks-git"
    "protonup-qt" # GUI for managing Proton versions
    "xpadneo" # Wireles xbox controller support
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
intelcpu=( # https://wiki.archlinux.org/title/Microcode#Loading_microcode
    "intel-ucode"
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
    "hyprutils-git"
    "hyprlang-git"
    "hyprcursor-git"
    "hyprwayland-scanner-git"
    "aquamarine-git"
    "hyprland-git" # Based (above are required otherwise hyprland-git sometimes won't build)
    "gamescope" # Valve magic
    "grimblast-git" # Screenshots
    "hyprpicker" # Color picker
    "qt5-wayland" # QT5 Wayland support
    "qt6-wayland" # QT6 Wayland support
    "waybar-git"
    "wl-clipboard" # xclip but wayland
    "wpaperd" # Desktop background
    "xdg-desktop-portal-hyprland-git"
    "xdg-desktop-portal-gtk"
    "xorg-xeyes" # Useful for debugging XWayland issues
)
insprill=( # Stuff I use that I doubt anyone else cares about
    "authy"
    "feishin-bin"
    "thunderbird"
    "unityhub"
    "vesktop-bin"
)

groups_list=(
    essentials
    amdcpu
    amdgpu
    catppuccin
    development
    gaming
    i3
    intelcpu
    nvidia
    hyprland
    insprill
)

dry_run=false
if [[ "$1" == "--dry-run" ]]; then
    dry_run=true
    echo "Dry run mode - no installations will be performed."
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
        if $dry_run; then
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
    local confirm
    for choice in "$@"; do
        list_group_packages "$choice"
    done

    read -p "Proceed with installation? (y/N): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        echo "Updating system..."
        if [ ! $dry_run ]; then
            sudo pacman -Syu
            yay -Syu
        fi
        for choice in "$@"; do
            local group_idx=$(( $choice - 1 ))
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
read -p "Enter the numbers of the groups you want to install (e.g., 1 2): " input
selected_choices=($input)

process_choice "${selected_choices[@]}"

echo "Installation complete."
