# zsh config

umask 022

if [[ -f ~/.no_zplugin ]]; then
	:
else
	# zplugin : https://github.com/zdharma/zplugin

	# Install zplugin if not installed
	if [[ ! -d ~/.zplugin ]]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
	fi

	source ~/.zplugin/bin/zplugin.zsh
	autoload -Uz _zplugin
	(( ${+_comps} )) && _comps[zplugin]=_zplugin

	source ~/.zsh/zplugin.zsh
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

