# zsh config

umask 022

if [[ -f ~/.no_zinit ]]; then
	:
else
	# zinit : https://github.com/zdharma-continuum/zinit
	ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

	# Install zinit if not installed
	if [[ ! -d ${ZINIT_HOME} ]]; then
		mkdir -p "$(dirname $ZINIT_HOME)"
		git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
	fi

	source "${ZINIT_HOME}/zinit.zsh"

	autoload -Uz _zinit
	(( ${+_comps} )) && _comps[zinit]=_zinit

	source ~/.zsh/zinit.zsh
fi

if [[ -f ~/.no_aqua ]]; then
	:
else
	# aqua: https://github.com/aquaproj/aqua
	export AQUA_ROOT_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua"

	if [[ ! -d "${AQUA_ROOT_DIR}" ]]; then
		curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v3.0.1/aqua-installer | bash
	fi

	export PATH="${AQUA_ROOT_DIR}/bin:${PATH}"
	export AQUA_GLOBAL_CONFIG="${HOME}/.config/aquaproj-aqua/aqua.yaml"

	if command -v zinit &>/dev/null; then
		zinit ice wait lucid id-as"aqua-completion" as"command" atclone"aqua completion zsh | sed '/^$/d' > _aqua" atpull"%atclone" run-atpull
		zinit light zdharma-continuum/null
	fi

	aqua i -a -l
fi

()
{
	local f
	for f in ~/.zsh/*_*.zsh(N-.)
	do
		source "$f"
	done
}

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
