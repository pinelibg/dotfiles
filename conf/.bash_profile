# .bash_profile
# shellcheck shell=bash

# source .profile
if [[ -f ~/.profile ]]; then
    . ~/.profile
fi

# source .bashrc
if [[ -f ~/.bashrc ]]; then
    . ~/.bashrc
fi

CONF_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd || exit 1)

if [[ -f ${CONF_DIR}/.bash_profile.local.bash ]]; then
    # shellcheck source=/dev/null
    . "${CONF_DIR}/.bash_profile.local.bash"
fi

unset CONF_DIR
