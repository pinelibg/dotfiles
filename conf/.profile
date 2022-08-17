# .profile
# shellcheck shell=sh

umask 022

[ -d "${HOME}/bin" ] && PATH="${HOME}/bin:$PATH"
export PATH

# shellcheck source=/dev/null
[ -f "${HOME}/.profile.local" ] && . "${HOME}/.profile.local"
