prompt_setup() {
	# from Tomorrow Night palette
	if [[ "$TERM" = *"256color" ]]; then
		color_red=167
		color_aqua=109
		color_green=143
		color_yellow=222
	else
		color_red="red"
		color_aqua="cyan"
		color_green="green"
		color_yellow="yellow"
	fi

	if [ ${UID} -eq 0 ]; then
		user_color=${color_red}
	else
		user_color=${color_aqua}
	fi
	dir_color=${color_green}
	git_color=${color_green}

	if [ ${UID} -eq 0 ]; then
		user_mark="$"
	else
		user_mark="#"
	fi

	if [ -n "$SSH_CONNECTION" ]; then
		prompt_hostname="%m@"
	else
		prompt_hostname=""
	fi

	PROMPT="%F{${user_color}}${prompt_hostname}%n %F{${dir_color}}%~ ${user_mark} %b%f%k"
	PROMPT2="%F{black}%K{${color_aqua}}%_>%k%f"
	SPROMPT="is \"%r\" correct? [(n)o,(y)es,(a)bort,(e)dit]: "
}

prompt_setup

# Set up the prompt
# autoload -Uz promptinit
# promptinit
# prompt adam1
