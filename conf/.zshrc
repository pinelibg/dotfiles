# zsh config

umask 022

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f ~/.no_aqua ]]; then
	:
else
	# aqua: https://github.com/aquaproj/aqua
	export AQUA_ROOT_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua"

	if [[ ! -d "${AQUA_ROOT_DIR}" ]]; then
		curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v4.0.2/aqua-installer | bash
	fi

	export PATH="${AQUA_ROOT_DIR}/bin:${PATH}"
	export AQUA_GLOBAL_CONFIG="${HOME}/.config/aquaproj-aqua/aqua.yaml"

	aqua i -a -l
fi

if [[ -f ~/.no_zinit ]]; then
	:
else
	# zinit : https://github.com/zdharma-continuum/zinit
	ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

	# Install zinit if not installed
	if [[ ! -d ${ZINIT_HOME} ]]; then
		mkdir -p "$(dirname ${ZINIT_HOME})"
		git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}"
	fi

	source "${ZINIT_HOME}/zinit.zsh"

	autoload -Uz _zinit
	(( ${+_comps} )) && _comps[zinit]=_zinit

	source ~/.zsh/zinit.zsh
fi

function zshrc_source_config()
{
	local f
	for f in ~/.zsh/[0-9]*_*.zsh(N-.)
	do
		source "${f}"
	done
}

zshrc_source_config
unfunction zshrc_source_config

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
