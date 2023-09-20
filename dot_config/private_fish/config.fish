set -U fish_greeting

# Aliases
alias ls="eza --icons --hyperlink"

# Bins
fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin

# Starship
starship init fish | source
