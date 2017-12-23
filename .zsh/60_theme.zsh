prompt_setup() {
	# from Tomorrow Night palette
	if [[ "$TERM" = *"256color" ]]; then
		local color_red=167
		local color_aqua=109
		local color_green=143
		local color_yellow=222
	else
		local color_red="red"
		local color_aqua="cyan"
		local color_green="green"
		local color_yellow="yellow"
	fi

	if [ ${UID} -eq 0 ]; then
		local user_color=${color_red}
	else
		local user_color=${color_aqua}
	fi
	local dir_color=${color_green}

	if [ ${UID} -eq 0 ]; then
		local user_mark="#"
	else
		local user_mark="$"
	fi

	if [ -n "$SSH_CONNECTION" ]; then
		local prompt_hostname="@%m"
	else
		local prompt_hostname=""
	fi

	PROMPT="%F{${user_color}}%n${prompt_hostname} %F{${dir_color}}%~ %b%f%k${user_mark} "
	PROMPT2="%F{black}%K{${color_aqua}}%_>%k%f"
	SPROMPT="is \"%r\" correct? [(n)o,(y)es,(a)bort,(e)dit]: "
}

# Use this theme only theme is not already loaded by zplug
if ! (type zplug &>/dev/null && zplug check "yous/lime") ; then
	prompt_setup
fi

unfunction prompt_setup

# Set up the prompt
# autoload -Uz promptinit
# promptinit
# prompt adam1

