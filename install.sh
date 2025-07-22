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
fi

# Initialize chezmoi with the current script directory as the source
"${INSTALL_DIR}/chezmoi" init --apply --source "${SCRIPT_DIR}"
