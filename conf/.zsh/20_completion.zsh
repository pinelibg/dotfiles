# compinit is automatically loaded by plugin loader
if ! (type zinit &>/dev/null || type compinit &>/dev/null) ; then
	autoload -Uz compinit
	compinit -u
fi

zstyle ':completion:*:default' menu select=1
if [[ -n "${LS_COLORS}" ]]; then
	zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' use-cache true

# Ignore completion function from command correction
CORRECT_IGNORE='_*'
