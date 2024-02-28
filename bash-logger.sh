#!/bin/bash

# Global options
LOG_LEVEL=${LOG_LEVEL:-INFO}
LOG_SCRIPT_NAME=${LOG_SCRIPT_NAME:-true}

. "$(dirname "${BASH_SOURCE[0]}")"/styles.sh

declare -r -A LOG_LEVELS=(
  [DEBUG]=0
  [INFO]=1
  [WARNING]=2
  [ERROR]=3
)

# Main log function.
# $1: should log script name (boolean)
# $2: style (on of the styles available in styles.sh)
# $3: content (string)
_log() {
  local log_script_name="${1}"
  local -n style="${2}"
  local content="${3}"

  if [[ "${level}" -ge "${LOG_LEVELS[${LOG_LEVEL}]}" ]]; then
    printf "%s%s\n" "${style[prefix]}" "${2}"
  fi

  printf "%s%s%s\n" "${script_name}" "${style[prefix]}" "${content}"
}

# Log a diagnostic message on stderr.
# $1: log level (among LOG_LEVELS)
# $2: content (string)
_log_diagnostic() {
  local level="${LOG_LEVELS[${1}]}"
  if [[ "${level}" -ge "${LOG_LEVELS[${LOG_LEVEL}]}" ]]; then
    _log "${1}" "${2}" >&2
  fi
}

log_debug() {
  _log_diagnostic DEBUG "${1}"
}

log_info() {
  _log_diagnostic INFO "${1}"
}

log_warn() {
  _log_diagnostic WARNING "${1}"
}

log_err() {
  _log_diagnostic ERROR "${1}"
}
