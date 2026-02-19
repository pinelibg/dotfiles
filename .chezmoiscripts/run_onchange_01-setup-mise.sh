#!/usr/bin/env bash

set -euo pipefail

MISE_BIN="${HOME}/.local/bin/mise"

if [[ -f "${MISE_BIN}" ]]; then
    echo "mise is already installed at ${MISE_BIN}."
else
    echo "Installing mise to ${MISE_BIN}..."
    curl https://mise.run | sh
fi
