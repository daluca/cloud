#!/usr/bin/env bash

# set -e

#############
# CONSTANTS #
#############

DEFAULT_LOG_LEVEL="WARNING"
SCRIPT_MODE=""
SOPS_CONFIG=()

#############
# Functions #
#############

function print_help () {
  echo "help!"
}

function fatal () {
  echo "FATAL    - $*"
  exit 123
}

function critical () {
  if [[ 50 -ge "${LOG_LEVEL}" ]]; then
    echo "CRITICAL - $*"
  fi
}

function error () {
  if [[ 40 -ge "${LOG_LEVEL}" ]]; then
    echo "ERROR    - $*"
  fi
}

function warning () {
  if [[ 30 -ge "${LOG_LEVEL}" ]]; then
    echo "WARNING  - $*"
  fi
}

function info () {
  if [[ 20 -ge "${LOG_LEVEL}" ]]; then
    echo "INFO     - $*"
  fi
}

function debug () {
  if [[ 10 -ge "${LOG_LEVEL}" ]]; then
    printf 'DEBUG    - %s\n' "$*"
  fi
}

function set_log_level () {
  case "$1" in
    critical|CRITICAL)
      LOG_LEVEL=50
      ;;
    error|ERROR)
      LOG_LEVEL=40
      ;;
    warning|WARNING)
      LOG_LEVEL=30
      ;;
    info|INFO)
      LOG_LEVEL=20
      ;;
    debug|DEBUG)
      LOG_LEVEL=10
      ;;
    *)
      set_log_level "${DEFAULT_LOG_LEVEL}"
      ;;
  esac
}

function validate_yaml () {
  local original_result
  local result
  local results

  original_result="$( yq 'tag == "!!map" or tag == "!!seq"' "$1" )"
  IFS=$'\n' read -d '' -r -a results <<< "${original_result}"
  debug "Number of results to check '${#results[@]}'"
  for result in "${results[@]}"; do
    debug "Checking individual result - '${result}"
    [[ "${result}" == true || "${result}" == "---" ]] || return 1
    debug "PASSED - '$1'"
  done
}

function validate_sops_metadata () {
  local result

  result="$( yq '.sops' "$2" )"
  if [[ "$1" == "present" ]]; then
    [[ "${result}" != null  ]] || return 1
  elif [[ "$1" == "absent" ]]; then
    [[ "${result}" == null ]] || return 1
  else
    fatal "No option given for validate_sops_metadata function"
  fi
}

###################
# Argument parser #
###################

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    -l|--log-level)
      LOG_LEVEL_NAME="$2"
      shift
      shift
      ;;
    --debug)
      set -x
      shift
      ;;
    -h|--help)
      print_help
      exit 0
      ;;
    -*)
      echo "Unknown option - $1"
      print_help
      exit 1
      ;;
    encrypt)
      SCRIPT_MODE="encrypt"
      shift
      ;;
    decrypt)
      SCRIPT_MODE="decrypt"
      shift
      ;;
    *)
      POSITIONAL_ARGS+=("$1")
      shift
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}"
set_log_level "${LOG_LEVEL_NAME}"

debug "Positional Arguments: ${POSITIONAL_ARGS[*]}"
debug "Number of Positional: ${#POSITIONAL_ARGS[*]}"
debug "Log level           : ${LOG_LEVEL}"

##############
# Run script #
##############

if [[ "${#POSITIONAL_ARGS[@]}" -eq 0 ]]; then
  warning "No positional arguments have been given, exiting"
  exit 1
elif [[ -n "${SCRIPT_MODE}" ]]; then
  debug "The script is entering '${SCRIPT_MODE}' mode"
else
  warning "No sub parser has been set, exiting"
  exit 1
fi

[[ -f ".sops.yaml" || -f ".sops.yml" ]] || fatal "no sops config file (.sops.yaml) found"

if [[ 20 -ge "${LOG_LEVEL}" ]]; then
  SOPS_CONFIG+=( "--verbose" )
fi

if [[ "${SCRIPT_MODE}" == "encrypt" ]]; then
  SOPS_CONFIG+=( "--encrypt" "--encrypted-regex" "^(data|stringData)$" "--in-place" )
elif [[ "${SCRIPT_MODE}" == "decrypt" ]]; then
  SOPS_CONFIG+=( "--decrypt" "--in-place" )
else
  fatal "I don't even know how you get here"
fi

info "Entering ${SCRIPT_MODE}ion mode"
for file in "${POSITIONAL_ARGS[@]}"; do
  debug "Checking '${file}' is valid yaml"
  validate_yaml "${file}" || fatal "File is not a valid yaml file"
  if [[ "${SCRIPT_MODE}" == "encrypt" ]]; then
    debug "Checking that no sops metadata is present in '${file}'"
    validate_sops_metadata "absent" "${file}" || continue
  elif [[ "${SCRIPT_MODE}" == "decrypt" ]]; then
    debug "Checking that sops metadata is present in '${file}'"
    validate_sops_metadata "present" "${file}" || continue
  else
    fatal "Seriously how did you get here?"
  fi
  debug "${SCRIPT_MODE^}ing '${file}' with sops age key"
  sops "${SOPS_CONFIG[@]}" "${file}" || fatal "Unable to ${SCRIPT_MODE} '${file}'"
  echo "${SCRIPT_MODE^^}ED - '${file}'"
done

debug "End of script"
