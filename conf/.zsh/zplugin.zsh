zplugin light zsh-users/zsh-completions

zplugin ice wait'!' lucid atinit'zpcompinit; zpcdreplay'; zplugin light zdharma/fast-syntax-highlighting

zplugin ice wait lucid atload'_zsh_autosuggest_start; bindkey "^ " autosuggest-accept'
zplugin light zsh-users/zsh-autosuggestions

zplugin ice wait lucid atload'
  bindkey "^P" history-substring-search-up
  bindkey "^N" history-substring-search-down'
zplugin light zsh-users/zsh-history-substring-search

zplugin snippet OMZ::plugins/git/git.plugin.zsh

# ssh-agent
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent lifetime 4h
zplugin snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh

zplugin ice from"gh-r" as"program"; zplugin light junegunn/fzf-bin

zplugin ice from"gh-r" as"program"; zplugin light peco/peco

ENHANCD_DISABLE_HOME=1
zplugin ice pick'init.sh' wait lucid nocompletions; zplugin light b4b4r07/enhancd

zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zplugin light trapd00r/LS_COLORS

DIRCOLORS_SOLARIZED_ZSH_THEME="256dark"
zplugin light pinelibg/dircolors-solarized-zsh

# theme
LIME_SHOW_HOSTNAME=1
LIME_DIR_DISPLAY_COMPONENTS=3
zplugin ice wait'!' lucid nocd atload'prompt_lime_precmd; zle reset-prompt'; zplugin light yous/lime

