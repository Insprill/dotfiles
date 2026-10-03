# dotfiles
The dotfiles I use on Arch... btw (and Windows).

All files are managed with [chezmoi](https://www.chezmoi.io/).  
You can read their documentation [here](https://www.chezmoi.io/install/).

These dotfiles are heavily customized to my liking, but if you'd like to try them
for whatever reason, and so I don't forget, here's how to get the system setup.




## Linux

### Distro Setup

#### CachyOS

1. [Download CachyOS Desktop Edition](https://cachyos.org/download/).
1. Flash the ISO to a USB drive (or use [Ventoy](https://www.ventoy.net/)).
1. Boot into the live ISO.
1. If you're using a laptop, ensure it's plugged in.
1. Connect to the internet (required).
1. In the `CachyOS Hello` window, click `Launch installer`.
1. Select `Limine` as your bootloader.
1. Wait for the installer window to open. This may take a moment.
1. Proceed through the installer to the `Desktop` step as normal.
1. Once on the `Desktop` step, select `No Desktop`.
1. In the `Additional packages` page, ensure the only selections are `Base-devel + Common packages`, `CPU specific Microcode update packages`, and optionally `Printing-Support`.
1. Finish the installation as normal.


### System Setup

1. After OS installation, reboot the machine.
2. Login to the account you made during installation.
3. Run the following command to install chezmoi.
```shell
sudo pacman -Syu chezmoi
```
4. Run the following command download & install the dotfiles. If you forked this repo, replace `Insprill` with your username.
```shell
chezmoi init Insprill && chezmoi apply
```
5. Run the following command to begin system setup. Follow the prompts it gives you as it goes.
Once it finishes, it will prompt you to reboot, and your system is (mostly) setup.
```shell
~/bin/setup-system
```


### Finalizing Setup

After rebooting, there are a few things you'll need to do manually.

#### Monitor Setup

To configure your monitors how you'd like, use the "Monique" program.
It's a fully GUI that lets you easily customize everything about your monitors from placement to scaling to color settings.

#### Wallpapers

To set your wallpaper directory, go to the control center (right-click on bar),
then click settings in the top right, go to the "Wallpaper" tab at the top left,
then set the "Wallpaper Directory" to wherever you plan on storing your wallpapers.

#### Drive Monitoring

To enable full drive health monitoring,
click on "Drive Health" in the control center,
and follow the setup instructions it shows.




## Windows (AtlasOS)

1. Follow the [AtlasOS Installation Guide](https://docs.atlasos.net/getting-started/installation/) until your system is setup.
2. Run the following command to install chezmoi.
```shell
winget install twpayne.chezmoi
```
3. Run the following command to download & install the dotfiles. If you forked this repo, replace `Insprill` with your username.
```shell
chezmoi init Insprill && chezmoi apply
```
4. Navigate to your home directory, and run the `setup.ps1` script with PowerShell as an Administrator.




## Secure Boot

To setup Secure Boot, follow [the CachyOS guide](https://wiki.cachyos.org/configuration/secure_boot_setup/).
