export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

if [ "${VSCODE_INJECTION}" = "1" ]; then
	export EDITOR="code --wait"
elif type nvim &>/dev/null; then
	export EDITOR=nvim
elif type vim &>/dev/null; then
	export EDITOR=vim
fi
