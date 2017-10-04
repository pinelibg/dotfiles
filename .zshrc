# zsh config

USE_ZPLUG=0
case "${OSTYPE}" in
	darwin*)
		# Mac
		USE_ZPLUG=1
		;;
	linux*)
		# Linux
		USE_ZPLUG=1
		;;
	cygwin | msys)
		# Windows
		USE_ZPLUG=0
		;;
esac

if [ ${USE_ZPLUG} = 1 ] && [ ! -d ~/.zplug ]; then
	echo "zplug is not installed"
	USE_ZPLUG=0
fi

# zplug : https://github.com/zplug/zplug
if [ ${USE_ZPLUG} = 1 ]; then
	source ~/.zplug/init.zsh

	zplug 'zplug/zplug', hook-build:'zplug --self-manage'
	zplug "zsh-users/zsh-syntax-highlighting", defer:2
	zplug "zsh-users/zsh-completions"
	zplug "zsh-users/zsh-history-substring-search", defer:3
	zplug "plugins/git", from:oh-my-zsh

	# ssh-agent
	zstyle :omz:plugins:ssh-agent agent-forwarding on
	zstyle :omz:plugins:ssh-agent lifetime 4h
	zplug "plugins/ssh-agent", from:oh-my-zsh

	zplug "junegunn/fzf-bin", \
		as:command, \
		rename-to:fzf, \
		from:gh-r
	ENHANCD_DISABLE_HOME=1
	zplug "b4b4r07/enhancd", use:init.sh

	# theme
	LIME_SHOW_HOSTNAME=1
	LIME_DIR_DISPLAY_COMPONENTS=3
	zplug "yous/lime"

	# Install plugins if there are plugins that have not been installed
	if ! zplug check --verbose; then
		printf "Install? [y/N]: "
		if read -q; then
			echo; zplug install
		fi
	fi

	# Then, source plugins and add commands to $PATH
	zplug load
fi

if [ ${USE_ZPLUG} = 0 ];then
	source ~/.zsh/theme.zsh
fi

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keyboard settings (enable Home End Insert... key)
source ~/.zsh/keyboard.zsh

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
function history-all { history -E 1 }

setopt histignorealldups
setopt sharehistory
setopt auto_pushd
setopt correct
setopt list_packed
setopt nolistbeep
setopt noautoremoveslash
setopt magic_equal_subst
# unsetopt automenu #use Ctrl-d to select
setopt nonomatch
setopt hist_verify
setopt hist_reduce_blanks
setopt ignoreeof # Not logout by Ctl+D

typeset -U path
typeset -U fpath

autoload -Uz compinit
compinit -u

zstyle ':completion:*:default' menu select=1
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' use-cache true

export WORDCHARS=${WORDCHARS:s,/,,}

if [ ${USE_ZPLUG} = 1 ] && zplug check "zsh-users/zsh-history-substring-search"; then
	bindkey '^P' history-substring-search-up
	bindkey '^N' history-substring-search-down
else
	bindkey '^P' history-beginning-search-backward
	bindkey '^N' history-beginning-search-forward
fi

bindkey "^D" menu-select

# Alias settings
source ~/.zsh/aliases.zsh

# Environment settings
[ -f ~/.myenv ] && source ~/.myenv

