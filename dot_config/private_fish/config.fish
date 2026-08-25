set -U fish_greeting
set -g fish_key_bindings fish_vi_key_bindings
bind -M insert -m default ctrl-c repaint-mode

# Aliases
alias lg="lazygit"
alias ls="eza --icons --hyperlink auto"
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
fish_add_path $HOME/.dotnet/tools

# Zoxide https://github.com/ajeetdsouza/zoxide
zoxide init fish | source

# Starship https://starship.rs/
starship init fish | source
