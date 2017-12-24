# zsh config

# zplug : https://github.com/zplug/zplug
if [ -f ~/.no_zplug ]; then
	:
elif [ ! -d ~/.zplug ]; then
	echo "zplug is not installed"
else
	export ZPLUG_LOADFILE=~/.zsh/zplug.zsh
	export ZPLUG_BIN=~/.zplug/bin
	source ~/.zplug/init.zsh

	if ! zplug check --verbose; then
		printf "Install? [y/N]: "
		if read -q; then
			echo; zplug install
		fi
	fi

	zplug load
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

