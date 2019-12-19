#!/bin/bash

SCRIPT_ROOT=$(cd $(dirname ${0}) && pwd)
CONF_DIR=${SCRIPT_ROOT}/conf
BACKUP_DIR=${HOME}/dotfiles_backup

DOTFILES=(
.vimrc .config/nvim .bash_profile .bashrc .profile .zshrc .zshenv .zsh .gitignore_global
)

mkdir -p ${HOME}/.config

for f in ${DOTFILES[@]}
do
	echo "Linking $f ..."

	if [[ -f ${HOME}/$f ]] && [[ ! -L ${HOME}/$f ]]; then
		echo "$f already exists. Back it up to ${BACKUP_DIR}/$f"
		mkdir -p $(dirname ${BACKUP_DIR}/$f)
		mv ${HOME}/$f ${BACKUP_DIR}/$f
	fi

	ln -vnsf ${CONF_DIR}/$f ${HOME}/$f
done

echo "Setting .gitignore_global"
if type git &>/dev/null; then
	git config --global core.excludesfile ~/.gitignore_global
else
	echo "Skipped. Git is not installed"
fi

echo "Installation finished"
