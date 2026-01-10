#!/bin/bash

SCRIPT_DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )" || exit 1 # This shouldn't fail™
STEPS_DIR="$SCRIPT_DIR/steps"
if ! cd "$STEPS_DIR"; then
    echo "Failed to find steps directory at '${STEPS_DIR}'!"
    exit 1
fi

steps=(
    01-install-packages
    02-remove-packages
    03-create-etc-links
    04-gpu-config-amd
    05-gpu-config-nvidia
    07-install-icon-theme
    08-rebuild-bat-cache
    09-enable-sddm
    10-set-shell
    # 11-install-hyprland-plugins
    12-install-rust-toolchains
    13-install-git-lfs
    14-disable-ufw
    16-delete-unnecessary-folders
    17-apply-gtk-theme
    20-enable-screen-recording
    21-mkinitcpio-hooks
    22-mkinitcpio-modules-decompress
    80-services-to-sockets
    90-adjust-sys-clock
    97-update-limine
    98-rebuild-initramfs
    99-reboot
)

step_name() {
    echo "${1#[0-9]*-}"
}

dry_run=false
if [[ "$1" == "--dry-run" ]]; then
    dry_run=true
    echo "Dry run mode - no system modifications will be made!"
fi

echo "Setup Steps:"
for i in "${!steps[@]}"; do
    echo "$((i+1)). $(step_name "${steps[i]}")"
done

read -p "Enter the numbers of the steps you'd like to skip, seperated by spaces: " -r -a steps_to_skip; echo

total_steps=${#steps[@]}
curr_step=1

IFS="|"
for step in "${steps[@]}"; do
    if [[ "${IFS}${steps_to_skip[*]}${IFS}" =~ "${IFS}${curr_step}${IFS}" ]]; then
        echo "[$curr_step/$total_steps] Skipping $(step_name "$step")..." >&2
    else
        echo "[$curr_step/$total_steps] Executing $(step_name "$step")..." >&2
        if ! bash "$step.sh" $dry_run; then
            echo "[$curr_step/$total_steps] ERROR: $step failed with exit code $?" >&2
            exit 1
        fi
    fi
    ((curr_step++))
done
unset IFS
