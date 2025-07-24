#!/bin/bash

set -e -o pipefail

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]:-$0}")" && pwd || exit 1)

# Setup chezmoi and install dotfiles

# Prepare installation directory
INSTALL_DIR="${HOME}/.local/bin"
if [[ ! -d "${INSTALL_DIR}" ]]; then
	echo "Creating installation directory at ${INSTALL_DIR}..."
	mkdir -p "${INSTALL_DIR}"
fi

# Check if chezmoi is installed, if not, install it
if ! command -v chezmoi &> /dev/null; then
		echo "chezmoi is not installed. Installing chezmoi..."
		if command -v curl &> /dev/null; then
			sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "${INSTALL_DIR}"
		elif command -v wget &> /dev/null; then
			sh -c "$(wget -qO- get.chezmoi.io)" -- -b "${INSTALL_DIR}"
		else
			echo "Neither curl nor wget is available. Please install one of them to proceed." >&2
			exit 1
		fi
		export PATH="${INSTALL_DIR}:${PATH}"
fi

# Configure chezmoi source directory to the current directory
if [[ ! -f "${SCRIPT_DIR}/chezmoi.toml" ]]; then
	echo "Creating chezmoi configuration file..."
	mkdir -p "${HOME}/.config/chezmoi"
	cat <<EOF > "${HOME}/.config/chezmoi/chezmoi.toml"
sourceDir = "${SCRIPT_DIR}"
EOF
else
	echo "chezmoi configuration file already exists."
	echo "To change the default source directory, edit ${HOME}/.config/chezmoi/chezmoi.toml"
fi

# Initialize chezmoi and apply the dotfiles
chezmoi init --apply
