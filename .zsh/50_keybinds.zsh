# emacs-like keybind
bindkey -e

if type zplug &>/dev/null && zplug check "zsh-users/zsh-history-substring-search"; then
	bindkey '^P' history-substring-search-up
	bindkey '^N' history-substring-search-down
else
	bindkey '^P' history-beginning-search-backward
	bindkey '^N' history-beginning-search-forward
fi

if type zplug &>/dev/null && zplug check "zsh-users/zsh-autosuggestions"; then
	bindkey '^ ' autosuggest-accept
fi

bindkey "^D" menu-select

