# delta
if command -v delta &>/dev/null; then
	set_git_config() {
		local current=$(git config --global --get "$1" 2>/dev/null)
		if [[ "${current}" != "$2" ]]; then
			git config --global "$1" "$2"
		fi
	}

	set_git_config core.pager delta
	set_git_config interactive.diffFilter 'delta --color-only'

	if git config --global --get merge.conflictStyle &>/dev/null; then
		git config --global --unset merge.conflictStyle
	fi

	set_git_config delta.navigate true
	set_git_config delta.line-numbers true
	set_git_config delta.side-by-side true

  unset -f set_git_config
fi
