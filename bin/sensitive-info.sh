#!/bin/bash

#############
# CONSTANTS #
#############

DEFAULT_LOG_LEVEL="WARNING"
DEFAULT_SECRET_FILES=("configuration/staging/cluster-secrets.sops.yaml")
DEFAULT_SENSITIVE_KEYS=("DOMAIN:")

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

###################
# Argument parser #
###################

POSITIONAL_ARGS=()
SECRET_FILES=()
SENSITIVE_KEYS=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    -s|--secret-file)
      SECRET_FILES+=("$2")
      shift
      shift
      ;;
    -k|--key)
      SENSITIVE_KEYS+=("$2")
      shift
      shift
      ;;
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

sensitive_info=()
SENSITIVE_KEYS=( "${SENSITIVE_KEYS[@]}" "${DEFAULT_SENSITIVE_KEYS[@]}" )
debug "Sensitive keys: '${SENSITIVE_KEYS[*]}'"

SECRET_FILES=( "${SECRET_FILES[@]}" "${DEFAULT_SECRET_FILES[@]}" )
for secret_file in "${SECRET_FILES[@]}"; do
  debug "Checking secret file exists: '${secret_file}'"
  [[ -f "${secret_file}" ]] || fatal "FAILED - '${secret_file}' doesn't exist"
done

for secret_file in "${SECRET_FILES[@]}"; do
  info "Secret file - '${secret_file}'"
  cluster_secrets_yaml=$( sops -d "${secret_file}" )
  IFS=$'\n' read -d '' -r -a cluster_secrets <<< "${cluster_secrets_yaml}"
  for secret in "${cluster_secrets[@]}"; do
    for key in "${SENSITIVE_KEYS[@]}"; do
      if [[ "${secret}" =~ .*${key}.* ]]; then
        debug "Adding '${secret#*: }' to sensitive_info list"
        sensitive_info+=("${secret#*: }")
      fi
    done
  done
done

for info in "${sensitive_info[@]}"; do
  debug "Checking info : ${info}"
  debug "Checking files: ${POSITIONAL_ARGS[*]}"
  result="$( grep -ri "${info}" "${POSITIONAL_ARGS[@]}" )"
  [[ -z "${result}" ]] || fatal "FAILED - '${result#*:}' found in '${result%:*}'"
done
