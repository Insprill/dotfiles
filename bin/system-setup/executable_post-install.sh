#!/bin/bash

# Remove unnecessary packages
echo "Removing unnecessary packages"
sudo pacman -Rdd dracut eos-dracut xterm

# Load AMD GPU drivers
read -p "Do you have an AMD GPU? [y/N] " -n 1 -r
echo # Newline
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Enable overclocking
    echo "Enabling overclocking support"
    sudo touch /usr/lib/modprobe.d/amdoverclocking.conf
    echo "options amdgpu ppfeaturemask=0xffffffff" | sudo tee /usr/lib/modprobe.d/amdoverclocking.conf
    # idek, copied from Garuda
    echo "Setting power mode"
    AMDGPU_RULES_FILE="/usr/lib/udev/rules.d/30-amdgpu-pm.rules"
    sudo touch $AMDGPU_RULES_FILE
    echo "KERNEL==\"card0\", SUBSYSTEM==\"drm\", DRIVERS==\"amdgpu\", ATTR{device/power_dpm_state}=\"performance\"" | sudo tee $AMDGPU_RULES_FILE
    # Load the kernel module
    echo "Added Kernel module"
    grep -q 'amdgpu' /etc/mkinitcpio.conf || sudo sed -i '/^MODULES=/s/)/ amdgpu)/' /etc/mkinitcpio.conf
fi

# Load Nvidia GPU drivers
read -p "Do you have an Nvidia GPU? [y/N] " -n 1 -r
echo # Newline
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Load the kernel module
    echo "Adding Kernel modules"
    NVIDIA_KERNEL_MODULES="nvidia mvidia_modeset nvidia_uvm nvidia_drm"
    grep -q $NVIDIA_KERNEL_MODULES /etc/mkinitcpio.conf || sudo sed -i "/^MODULES=/s/)/ $NVIDIA_KERNEL_MODULES)/" /etc/mkinitcpio.conf
fi

# Change shell
echo "Changing shell to fish"
NEW_SHELL_PATH="/usr/bin/fish"
if ! grep -q "^$NEW_SHELL_PATH$" /etc/shells; then
    echo "$NEW_SHELL_PATH" | sudo tee -a /etc/shells
fi
chsh -s /usr/bin/fish

# Set some themes to Catppuccin
read -p "Do you want to use the Catppuccin theme? [y/N] " -n 1 -r
echo # Newline
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # SDDM
    echo "Setting SDDM theme"
    SDDM_CONF_DIR="/etc/sddm.conf.d"
    SDDM_CONF_FILE="$SDDM_CONF_DIR/catppuccin.conf"
    sudo mkdir -p $SDDM_CONF_DIR
    sudo rm $SDDM_CONF_FILE # Remove in case it already exists
    sudo touch $SDDM_CONF_FILE
    echo "[Theme]" | sudo tee -a $SDDM_CONF_FILE
    echo "Current=catppuccin-mocha" | sudo tee -a $SDDM_CONF_FILE
    # GRUB
    echo "Setting GRUB theme"
    git clone https://github.com/catppuccin/grub.git catppuccin-grub && cd catppuccin-grub
    sudo cp -r src/* /usr/share/grub/themes/
    cd ..
    rm -rf catppuccin-grub
    if ! grep -q '^GRUB_THEME=' /etc/default/grub; then
        echo "GRUB_THEME=/usr/share/grub/themes/catppuccin-mocha-grub-theme/theme.txt" | sudo tee -a /etc/default/grub
    fi
fi

# Update GRUB config (theme, microcode)
echo "Updating the GRUB config"
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Enable SDDM
echo "Enabling SDDM"
sudo systemctl enable sddm.service

# Setup global environment variables
set_env_var() {
    local var_name=$1
    local var_value=$2
    local env_file="/etc/environment"

    if grep -q "^${var_name}=" "$env_file"; then
        sudo sed -i "s/^${var_name}=.*/${var_name}=${var_value}/" "$env_file"
    else
        echo "${var_name}=${var_value}" | sudo tee -a "$env_file" > /dev/null
    fi
}
echo "Setting system-wide environment variables"
set_env_var "QT_QPA_PLATFORMTHEME" "qt5ct"
set_env_var "QT_STYLE_OVERRIDE" "kvantum"
set_env_var "BROWSER" "firefox-developer-edition"
set_env_var "EDITOR" "nvim"

# Setup development stuff
read -p "Do you want to setup some development related things? (git, vscode, etc) [y/N] " -n 1 -r
echo # Newline
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Set the default Git credential helper
    echo "Setting default Git credential helper"
    git config --global credential.helper /usr/lib/git-core/git-credential-libsecret
    # Login to GitHub
    echo "Logging out of GitHub if we're already logged in"
    bash -c gh auth logout # Logout in case we're already logged in
    echo "Logging into GitHub"
    bash -c gh auth login
    # Set the default VSC password store
    update_json() {
        local json_file=$(eval echo $1)  # Expands the tilde in the file path
        local key=$2                     # The key to add/update
        local value=$3                   # The value for the key
        local temp_file=$(mktemp)

        # Remove comments and save to a temporary file
        sed '/^\s*\/\//d' "$json_file" > "$temp_file"

        # Check if the file exists
        if [ ! -s "$temp_file" ]; then
            # File is empty after removing comments, create it with initial key-value
            echo "{\"$key\": \"$value\"}" > "$json_file"
        else
            # File exists and is not empty, add or update the key-value
            jq --arg key "$key" --arg value "$value" \
               '.[$key] = $value' "$temp_file" > "$json_file"
        fi

        # Clean up
        rm "$temp_file"
    }
    echo "Setting default Visual Studio Code password store"
    update_json "~/.vscode/argv.json" "password-store" "gnome"
    # Install the default Rust toolchain
    echo "Installing the default Rust toolchain"
    rustup toolchain install stable
    # Setup Git LFS
    git lfs install
fi

# Enable clipping
read -p "Do you want to enable clipping (must have gpu-screen-recorder installed)? [y/N] " -n 1 -r
echo # Newline
if [[ $REPLY =~ ^[Yy]$ ]]
then
    systemctl --user enable gpu-screen-recorder-replay.service
    systemctl --user start gpu-screen-recorder-replay.service
fi

# Fix Linux changing the time in Windows
timedatectl set-local-rtc 1 --adjust-system-clock

# Update initramfs
echo "Rebuilding initramfs"
sudo mkinitcpio -P

