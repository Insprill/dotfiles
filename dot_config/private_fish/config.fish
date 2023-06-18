set -U fish_greeting

# Bins
fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin

# Cargo
fish_add_path $HOME/.cargo/bin

# Starship
starship init fish | source
