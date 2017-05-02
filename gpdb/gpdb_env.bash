ORCA_INSTALL_PATH=/usr/local/
ORCA_PREFIX=gporca

use_orca () {
	local ver
  ver="$1"
  echo_and_run() { echo "$@" ; "$@" ; }
	
  echo_and_run export CONF_INC="${ORCA_INSTALL_PATH}/$1/include"
  echo_and_run export CONF_LIB="${ORCA_INSTALL_PATH}/$1/lib"
  echo_and_run export CONF_RPATH="${ORCA_INSTALL_PATH}/$1/lib"
}

_use_orca_complete()
{
  _script_commands=$(ls "${ORCA_INSTALL_PATH}" | grep gporca)

  local cur
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  COMPREPLY=( $(compgen -W "${_script_commands}" -- ${cur}) )

  return 0
}
complete -o nospace -F _use_orca_complete use_orca
