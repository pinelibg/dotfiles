typeset -U path
path=( \
	/usr/local/bin(N-/) \
	~/bin(N-/) \
	"$path[@]" \
)

typeset -U fpath

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

export EDITOR=vim

