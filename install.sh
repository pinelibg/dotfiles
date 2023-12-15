#!/bin/bash

SCRIPT_ROOT=$(cd "$(dirname "${0}")" && pwd || exit 1)
CONF_DIR=${SCRIPT_ROOT}/conf
BACKUP_DIR=${HOME}/dotfiles_backup

DOTFILES=(
.vimrc .config/nvim .config/aquaproj-aqua .zsh .gitignore_global
)

mkdir -p "${HOME}/.config"

for f in "${DOTFILES[@]}"
do
	echo "Linking ${f} ..."

	if [[ -f ${HOME}/${f} ]] && [[ ! -L ${HOME}/${f} ]]; then
		echo "${f} already exists. Back it up to ${BACKUP_DIR}/${f}"
		mkdir -p "$(dirname "${BACKUP_DIR}/${f}")"
		mv "${HOME}/${f}" "${BACKUP_DIR}/${f}"
	fi

	ln -vnsf "${CONF_DIR}/${f}" "${HOME}/${f}"
done

SHELL_RCS=(
.bash_profile .bashrc .profile .zshenv .zshrc
)

for f in "${SHELL_RCS[@]}"
do
	echo "Creating shell config file ${f} ..."

	if [[ -f ${HOME}/${f} ]]; then
		if grep -q '^# MANAGED BLOCK BY DOTFILE$' "${HOME}/${f}"; then
			continue
		fi

		if [[ ! -L ${HOME}/${f} ]]; then
			echo "${f} already exists. Back it up to ${BACKUP_DIR}/${f}"
			mkdir -p "$(dirname "${BACKUP_DIR}/${f}")"
			mv "${HOME}/${f}" "${BACKUP_DIR}/${f}"
		else
			unlink "${HOME}/${f}"
		fi
	fi

	cat <<-EOS >>"${HOME}/${f}"
		# MANAGED BLOCK BY DOTFILE
		test -f "${CONF_DIR}/${f}" && . "${CONF_DIR}/${f}"
		# END OF MANAGED BLOCK BY DOTFILE
		EOS
done

echo "Setting .gitignore_global"
if type git &>/dev/null; then
	git config --global core.excludesfile ~/.gitignore_global
else
	echo "Skipped. Git is not installed"
fi

echo "Update Git index to ignore per-machine configurations' changes"
LOCAL_FILES=(
	"conf/.config/aquaproj-aqua/local.yaml"
)
for f in "${LOCAL_FILES[@]}"
do
	echo "Ignoring ${f} ..."
	git update-index --assume-unchanged "${f}"
done

echo "Installation finished"
