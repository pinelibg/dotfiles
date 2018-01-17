# vim:ft=zplug

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
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

zplug "peco/peco", \
	as:command, \
	from:gh-r

ENHANCD_DISABLE_HOME=1
zplug "b4b4r07/enhancd", use:init.sh

# theme
LIME_SHOW_HOSTNAME=1
LIME_DIR_DISPLAY_COMPONENTS=3
zplug "yous/lime"

DIRCOLORS_SOLARIZED_ZSH_THEME="256dark"
zplug "pinelibg/dircolors-solarized-zsh"

