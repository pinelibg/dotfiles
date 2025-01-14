if command -v eza &>/dev/null; then
	alias ls='eza -bghF --smart-group --icons --git --time-style=iso --group-directories-first'
	alias lt='ls -T -L2 --git-ignore -I \".git\"'
	alias lta='lt -a'
elif gls --color=auto &>/dev/null; then
	alias ls='gls --color=auto -hF --group-directories-first'
elif ls --color=auto &>/dev/null; then
	alias ls='ls --color=auto -hF --group-directories-first'
else # macos's ls
	alias ls='ls -G -hF'
fi
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

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

# mkcd: create a directory and cd into it
mkcd() {
	if [[ "$#" -eq 0 ]]; then
		echo "Usage: mkcd <dir>" >&2
		return 1
	fi
	mkdir -p "$@" && cd "${@:$#}" || return 1
}
