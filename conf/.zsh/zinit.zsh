zinit light zsh-users/zsh-completions

zinit ice wait'!' lucid atinit'zpcompinit; zpcdreplay'; zinit light zdharma/fast-syntax-highlighting

zinit ice wait lucid atload'_zsh_autosuggest_start; bindkey "^ " autosuggest-accept'
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid atload'
  bindkey "^P" history-substring-search-up
  bindkey "^N" history-substring-search-down'
zinit light zsh-users/zsh-history-substring-search

zinit snippet OMZ::plugins/git/git.plugin.zsh

# ssh-agent
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent lifetime 4h
zinit snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh

zinit ice from"gh-r" as"program"; zinit light junegunn/fzf-bin

zinit ice from"gh-r" as"program"; zinit light peco/peco

ENHANCD_DISABLE_HOME=1
zinit ice pick'init.sh' wait lucid nocompletions; zinit light b4b4r07/enhancd

zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zinit light trapd00r/LS_COLORS

DIRCOLORS_SOLARIZED_ZSH_THEME="256dark"
zinit light pinelibg/dircolors-solarized-zsh

# theme
LIME_SHOW_HOSTNAME=1
LIME_DIR_DISPLAY_COMPONENTS=3
zinit ice wait'!' lucid nocd atload'prompt_lime_precmd; zle reset-prompt'; zinit light yous/lime

