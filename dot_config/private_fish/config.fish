set -U fish_greeting

# Aliases
alias lg="lazygit"
alias ls="eza --icons --hyperlink"
alias rg="rg -uuS"
alias pacdiff="sudo env DIFFPROG='nvim -d' pacdiff"
alias yeet="git push --force-with-lease"
alias shipit="git push"
alias sure="git add . && git rebase --continue"
alias based="git rebase --committer-date-is-author-date --rebase-merges"

# Bins
fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin

# Zoxide https://github.com/ajeetdsouza/zoxide
zoxide init fish | source

# Starship https://starship.rs/
starship init fish | source
