#!/bin/bash

SCRIPT_DIR=$(cd $(dirname ${0}) && pwd)

BACKUP_DIR=${HOME}/dotfiles_backup

DOTFILES=(
.vimrc .zshrc .zshenv .zsh
)

for f in ${DOTFILES[@]}
do
	echo "Linking $f ..."

	if [ -f ${HOME}/$f ] && [ ! -L ${HOME}/$f ]; then
		echo "$f already exists. Back it up to ${BACKUP_DIR}/$f"
		mkdir -p `dirname ${BACKUP_DIR}/$f`
		mv ${HOME}/$f ${BACKUP_DIR}/$f
	fi

	ln -vnsf ${SCRIPT_DIR}/$f ${HOME}/$f
done

