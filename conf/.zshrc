# zsh config

umask 022

if [[ -f ~/.no_zinit ]]; then
	:
else
	# zinit : https://github.com/zdharma/zinit

	# Install zinit if not installed
	if [[ ! -d ~/.zinit ]]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
	fi

	source ~/.zinit/bin/zinit.zsh
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

