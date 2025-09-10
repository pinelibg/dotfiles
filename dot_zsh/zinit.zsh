zinit ice wait lucid blockf; zinit light zsh-users/zsh-completions
zinit ice wait'!0z' lucid atinit"zicompinit; zicdreplay"; zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice wait lucid atload'_zsh_autosuggest_start; bindkey "^ " autosuggest-accept'
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid atload'
  bindkey "^P" history-substring-search-up
  bindkey "^N" history-substring-search-down'
zinit light zsh-users/zsh-history-substring-search

zinit ice wait lucid
zinit light olets/zsh-abbr

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
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship
zinit ice wait lucid; zinit light trystan2k/zsh-tab-title

zinit ice has"aqua" wait lucid id-as"aqua-completion" as"program" atclone"aqua completion zsh | sed '/^$/d' > _aqua" atpull"%atclone" run-atpull
zinit light zdharma-continuum/null

zinit ice has"gh" wait lucid id-as"gh-cli-comp" as"program" atclone"gh completion -s zsh > _gh" atpull"%atclone" run-atpull
zinit light zdharma-continuum/null

[[ -f ~/.zsh/zinit.zsh.local ]] && source ~/.zsh/zinit.zsh.local
