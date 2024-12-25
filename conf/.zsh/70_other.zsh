# delta
if command -v delta &>/dev/null; then
	git config --global core.pager delta
	git config --global interactive.diffFilter 'delta --color-only'
	git config --global merge.conflictStyle zdiff3
	git config --global delta.navigate true
	git config --global delta.line-numbers true
	git config --global delta.side-by-side true
fi
