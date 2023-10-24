# ssh-pageant (ssh-agent for PuTTY's Pageant)
if [[ -e /usr/bin/ssh-pageant ]]; then
	eval $(/usr/bin/ssh-pageant -r -a "/tmp/.ssh-pageant-$USERNAME")
fi

# delta
if command -v delta &>/dev/null; then
	git config --global core.pager delta
	git config --global delta.line-numbers true
	git config --global delta.side-by-side true
fi
