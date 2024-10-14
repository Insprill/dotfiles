set -U fish_greeting

# Aliases
alias ls="eza --icons --hyperlink"
alias pacdiff="sudo env DIFFPROG='nvim -d' pacdiff"
alias yeet="git push -f"
alias shipit="git push"
alias sure="git add . && git rebase --continue"
alias based="git rebase --committer-date-is-author-date"

# Bins
fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin

# Zoxide https://github.com/ajeetdsouza/zoxide
zoxide init fish | source

# Starship https://starship.rs/
starship init fish | source
