# .zshenv

CONF_DIR="${${(%):-%x}:A:h}"

typeset -U path
path=( \
	/usr/local/bin(N-/) \
	~/bin(N-/) \
	~/.local/bin(N-/) \
	"$path[@]" \
)

typeset -U fpath

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

if type nvim &>/dev/null; then
	export EDITOR=nvim
elif type vim &>/dev/null; then
	export EDITOR=vim
fi

# Skip the not really helping Ubuntu global compinit
skip_global_compinit=1

[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
[[ -f ${CONF_DIR}/.zshenv.local.zsh ]] && source "${CONF_DIR}/.zshenv.local.zsh"

unset CONF_DIR
