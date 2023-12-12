# dotfiles
The dotfiles I use on Arch... btw.

All files are managed with [chezmoi](https://www.chezmoi.io/).  
You can read their documentation [here](https://www.chezmoi.io/install/).

These dotfiles are heavily customized to my liking, but if you'd like to try them
for whatever reason, and so I don't forget, here's how to get the system setup.

## Setup

These dotfiles are made for [EndeavourOS](https://endeavouros.com/).
Things may not work correctly on other distros.

When installing, don't select a desktop.
When asked what packages should be installed, ensure the X packages are checked,
but Firefox and EndeavourOS Applications are not.
Use common sense with the other packages to select/unselect.

Once the system is setup, install Chezmoi to get the dotfiles
```shell
sudo pacman -Syu chezmoi
```

To install the dotfiles, run
```shell
chezmoi init Insprill
chezmoi apply
```

If you have a fork of this repository, replace `Insprill` with your GitHub username,
or you can provide a full URL to a repository.
Chezmoi's documentation has more information.

To get the rest of the system setup, run the `setup-system` script in the `~/bin` directory.
```shell
~/bin/setup-system
```

Follow the prompts, and when finished, reboot with `sudo reboot`.

