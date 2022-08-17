# zsh config

umask 022

if [[ -f ~/.no_zinit ]]; then
	:
else
	# zinit : https://github.com/zdharma-continuum/zinit
	ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

	# Install zinit if not installed
	if [[ ! -d ${ZINIT_HOME} ]]; then
		mkdir -p "$(dirname $ZINIT_HOME)"
		git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
	fi

	source "${ZINIT_HOME}/zinit.zsh"

	autoload -Uz _zinit
	(( ${+_comps} )) && _comps[zinit]=_zinit

	source ~/.zsh/zinit.zsh
fi

()
{
	local f
	for f in ~/.zsh/*_*.zsh(N-.)
	do
		source "$f"
	done
}

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
