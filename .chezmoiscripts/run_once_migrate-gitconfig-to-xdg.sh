#!/usr/bin/env bash

# Migrate git config settings from ~/.gitconfig to XDG (~/.config/git/config)
# These keys are now managed directly in dot_config/git/config

set -euo pipefail

if [[ ! -f "${HOME}/.gitconfig" ]]; then
	exit 0
fi

unset_if_set() {
	local key="$1"
	if git config --global --get "${key}" &>/dev/null; then
		git config --global --unset "${key}"
		echo "Unset ${key} from ~/.gitconfig"
	fi
}

unset_if_set core.excludesfile
unset_if_set core.pager
unset_if_set interactive.diffFilter
unset_if_set delta.navigate
unset_if_set delta.line-numbers
unset_if_set delta.side-by-side
