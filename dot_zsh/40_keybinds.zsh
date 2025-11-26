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

# Ctrl + left/right arrow keys to move between words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Option + left/right arrow keys to move between words
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# Ctrl + backspace/delete to delete word backword/forward
bindkey '^H' backward-kill-word
bindkey '5~' kill-word

bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# Ctrl + r to search history with fzf
function fzf-select-history() {
 BUFFER=$(history -r 1 | fzf --query "${LBUFFER}" --layout reverse --height 40% --nth 2.. --bind 'enter:become:echo {2..}' --tiebreak index)
 CURSOR=${#BUFFER}
 zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history
