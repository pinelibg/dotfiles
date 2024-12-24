PATH=$ZPFX/bin:$PATH

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

zinit ice wait lucid blockf; zinit light Aloxaf/fzf-tab

zinit ice wait lucid blockf; zinit light rupa/z
zinit ice wait lucid; zinit light mrjohannchang/fz.sh

DIRCOLORS_SOLARIZED_ZSH_THEME="256dark"
zinit ice wait lucid; zinit light pinelibg/dircolors-solarized-zsh

# theme
[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit ice wait lucid; zinit light trystan2k/zsh-tab-title

[[ -f ~/.zsh/zinit.zsh.local ]] && source ~/.zsh/zinit.zsh.local
