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

zinit ice wait lucid from"gh-r" sbin"fzf"; zinit light junegunn/fzf-bin

zinit ice wait lucid from"gh-r" sbin"**/peco"; zinit light peco/peco

ENHANCD_DISABLE_HOME=1
zinit ice pick'init.sh' wait lucid nocompletions; zinit light b4b4r07/enhancd

zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zinit light trapd00r/LS_COLORS

DIRCOLORS_SOLARIZED_ZSH_THEME="256dark"
zinit light pinelibg/dircolors-solarized-zsh

zinit ice wait lucid from"gh-r" sbin"bin/exa" atload"alias exa='exa -hg --icons --git --time-style iso'; alias ls=exa; alias lt='ls -T -L2'; alias lta='lt -a -I \"node_modules|.git|.cache\"'"; zinit light ogham/exa
zinit ice wait lucid from"gh-r" sbin"**/fd"; zinit light sharkdp/fd
zinit ice wait lucid from"gh-r" sbin"**/bat" atload"alias cat='bat -pp'"; zinit light sharkdp/bat
zinit ice wait lucid as"command" from"gh-r" pick"**/delta" atload"git config --global core.pager delta; git config --global delta.line-numbers true; git config --global delta.side-by-side true"; zinit light dandavison/delta

# theme
[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit ice wait lucid; zinit light trystan2k/zsh-tab-title

[[ -f ~/.zsh/zinit.zsh.local ]] && source ~/.zsh/zinit.zsh.local

