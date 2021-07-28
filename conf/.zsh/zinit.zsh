PATH=$ZPFX/bin:$PATH
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

zinit light zsh-users/zsh-completions

zinit ice wait'!' lucid atinit'zpcompinit; zpcdreplay'; zinit light zdharma/fast-syntax-highlighting

zinit ice wait lucid atload'_zsh_autosuggest_start; bindkey "^ " autosuggest-accept'
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid atload'
  bindkey "^P" history-substring-search-up
  bindkey "^N" history-substring-search-down'
zinit light zsh-users/zsh-history-substring-search

zinit ice wait lucid; zinit snippet OMZ::plugins/git/git.plugin.zsh

# ssh-agent
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent lifetime 4h
zinit ice wait lucid silent; zinit snippet OMZ::plugins/ssh-agent/ssh-agent.plugin.zsh

zinit ice wait lucid from"gh-r" sbin"fzf"; zinit light junegunn/fzf-bin

zinit ice wait lucid from"gh-r" sbin"**/peco"; zinit light peco/peco

ENHANCD_DISABLE_HOME=1
zinit ice pick'init.sh' wait lucid nocompletions; zinit light b4b4r07/enhancd

zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zinit light trapd00r/LS_COLORS

DIRCOLORS_SOLARIZED_ZSH_THEME="256dark"
zinit light pinelibg/dircolors-solarized-zsh

zinit ice wait lucid from"gh-r" sbin"bin/exa" atload"alias ls=exa; alias ll='ls -lhg --time-style iso'; alias lt='exa -Tlhg -L2'"; zinit light ogham/exa
zinit ice wait lucid from"gh-r" sbin"**/fd"; zinit light sharkdp/fd
zinit ice wait lucid from"gh-r" sbin"**/bat"; zinit light sharkdp/bat

zinit from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
        direnv/direnv

# theme
[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit ice wait lucid; zinit light trystan2k/zsh-tab-title

[[ -f ~/.zsh/zinit.zsh.local ]] && source ~/.zsh/zinit.zsh.local

