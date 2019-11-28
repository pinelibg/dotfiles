# zsh config

umask 022

# zplugin : https://github.com/zdharma/zplugin
if [ -f ~/.no_zplugin ]; then
	:
elif [ ! -d ~/.zplugin ]; then
	echo "zplugin(https://github.com/zdharma/zplugin) is not installed"
else
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

