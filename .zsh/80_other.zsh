# ssh-pageant (ssh-agent for PuTTY's Pageant)
if [[ -e /usr/bin/ssh-pageant ]]; then
	eval $(/usr/bin/ssh-pageant -r -a "/tmp/.ssh-pageant-$USERNAME")
fi

