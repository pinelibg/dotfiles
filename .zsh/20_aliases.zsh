if ls --color=auto &>/dev/null; then
	alias ls='ls --color=auto'
elif gls --color=auto &>/dev/null; then
	alias ls='gls --color=auto'
else
	alias ls='ls -G'
fi
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias du='du -h'
alias df='df -h'
alias grep='grep --color=auto'

# enable alias in sudo
alias sudo='sudo '

# Formatted CSV viewer
alias csv='column -s, -t'

