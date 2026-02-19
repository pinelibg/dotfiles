#!/usr/bin/env bash

set -euo pipefail

MISE_CONFIG="${HOME}/.config/mise/config.toml"
MISE_LOCAL_CONFIG="${HOME}/.config/mise/config.local.toml"

if [[ -f "${MISE_CONFIG}" ]] && [[ ! -f "${MISE_LOCAL_CONFIG}" ]]; then
    echo "Migrating existing ${MISE_CONFIG} to ${MISE_LOCAL_CONFIG}..."
    mv "${MISE_CONFIG}" "${MISE_LOCAL_CONFIG}"
fi
