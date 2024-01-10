if command -v eza &>/dev/null; then
	alias eza='eza -hg --icons --git --time-style iso'
	alias ls=eza
	alias lt='ls -T -L2'
	alias lta='lt -a -I \"node_modules|.git|.cache\"'
elif gls --color=auto &>/dev/null; then
	alias ls='gls --color=auto -F'
elif ls --color=auto &>/dev/null; then
	alias ls='ls --color=auto -F'
else # macos's ls
	alias ls='ls -GF'
fi
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lha'

alias du='du -h'
alias df='df -h'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enable completion in sudo
alias sudo='sudo '

# Formatted CSV viewer
alias csv='column -s, -t'

# Options passed to less
export LESS='-iMR -# 4 -x4'

# bat
if command -v bat &>/dev/null; then
	alias cat='bat -pp'
fi
