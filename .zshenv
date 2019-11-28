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

# Skip the not really helping Ubuntu global compinit
skip_global_compinit=1

[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local

