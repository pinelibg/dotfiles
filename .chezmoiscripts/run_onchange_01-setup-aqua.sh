#!/bin/bash

set -e

export AQUA_ROOT_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua"

if [[ -d "${AQUA_ROOT_DIR}" ]]; then
    echo "aqua is already installed at ${AQUA_ROOT_DIR}."
else
    echo "Installing aqua to ${AQUA_ROOT_DIR}..."
    curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v4.0.2/aqua-installer | bash
fi
