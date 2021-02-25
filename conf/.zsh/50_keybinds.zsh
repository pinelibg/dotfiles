# emacs-like keybind
bindkey -e

# Will be overwritten by zsh-history-substring-search
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# Ctrl+Q: Save a partially written commands and resume after the next command
# or make all lines editable when writing a multi-line command
bindkey '^Q' push-line-or-edit
bindkey '^[Q' push-line-or-edit
bindkey '^[q' push-line-or-edit

