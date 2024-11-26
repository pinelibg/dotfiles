PATH=$ZPFX/bin:$PATH
zinit light-mode for \
    zdharma-continuum/z-a-rust \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-bin-gem-node


zinit ice wait lucid blockf; zinit light zsh-users/zsh-completions
zinit ice wait'!0z' lucid atinit"zicompinit; zicdreplay"; zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice wait lucid atload'_zsh_autosuggest_start; bindkey "^ " autosuggest-accept'
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid atload'
  bindkey "^P" history-substring-search-up
  bindkey "^N" history-substring-search-down'
zinit light zsh-users/zsh-history-substring-search

zinit ice wait lucid; zinit snippet OMZ::plugins/git/git.plugin.zsh

# ssh-agent
zstyle :omz:plugins:ssh-agent quiet yes
zstyle :omz:plugins:ssh-agent agent-forwarding on
zinit ice wait lucid silent; zinit snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh

zinit ice wait lucid blockf; zinit light rupa/z
zinit ice wait lucid; zinit light mrjohannchang/fz.sh

zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zinit light trapd00r/LS_COLORS

DIRCOLORS_SOLARIZED_ZSH_THEME="256dark"
zinit light pinelibg/dircolors-solarized-zsh

# theme
[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit ice wait lucid; zinit light trystan2k/zsh-tab-title

[[ -f ~/.zsh/zinit.zsh.local ]] && source ~/.zsh/zinit.zsh.local
