# compinit is automatically loaded in zplug
if ! (type compinit &>/dev/null) ; then
	autoload -Uz compinit
	compinit -u
fi

# Set LS_COLORS variable
if [[ -z "${LS_COLORS}" ]]; then
	if type dircolors &>/dev/null; then
		eval "$(dircolors -b)"
	elif type gdircolors &>/dev/null; then
		eval "$(gdircolors -b)"
	fi
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

