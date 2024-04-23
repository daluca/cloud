#!/usr/bin/env bash

#############
# CONSTANTS #
#############

DEFAULT_LOG_LEVEL="WARNING"
KUBECONFORM_CONFIG=("-strict" "-ignore-missing-schemas" "-schema-location" "default" "-schema-location" "/tmp/flux-crd-schemas" "-schema-location" "/tmp/cert-manager-crd-schemas" "-verbose")
KUSTOMIZE_CONFIG=("--load-restrictor" "LoadRestrictionsNone")

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

function remove_duplicates () {
  declare -A duplicates
  for i in "$@"; do
    debug "Checking if '${i}' is a duplicate"
    if [[ -z "${duplicates[${i}]}" ]]; then
      debug "'${i}' is not a duplicate"
      KUSTOMIZE_SET_DIRS+=( "${i}" )
      duplicates[${i}]=1
    fi
  done
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
    info "PASSED - '$1'"
  done
}

function kubeconform_validate () {
  local original_result
  local result
  local results

  original_result="$( kubeconform "${KUBECONFORM_CONFIG[@]}" "$1" )"
  debug "Original result - '${original_result}'"
  IFS=$'\n' read -d '' -r -a results <<< "${original_result}"
  debug "Number of results to check '${#results[@]}'"
  for result in "${results[@]}"; do
    debug "Checking individual result - '${result}'"
    if [[ "${result}" =~ ^$1\ -\ Kustomization\ [A-Za-z0-9_-]*\ is\ valid$ ]]; then
      info "PASSED - '${file}'"
    elif [[ "${result}" =~ ^$1\ -\ [A-Za-z0-9_-]*\ Kustomization\ skipped$ ]]; then
      info "SKIPPED - '${file}'"
    else
      debug "FAILED - result of kubeconform '${result}'"
      fatal "FAILED - '${file}'"
    fi
  done
}

function kustomize_validate () {
  local kustomize_result
  local yq_result
  local kubeconform_result
  local result
  local results

  kustomize_result=$( kustomize build "$1" "${KUSTOMIZE_CONFIG[@]}" )
  if [[ "${PIPESTATUS[0]}" != 0 ]]; then
    error "FAILED - kustomize result '${kustomize_result}'"
    fatal "FAILED - $1"
  else
    debug "kustomize built correctly '$1'"
  fi

  yq_result=$( echo "${kustomize_result}" | yq "del(.sops)" )
  if [[ "${PIPESTATUS[0]}" != 0 ]]; then
    error "FAILED - yq result '${kustomize_result}'"
    fatal "FAILED - $1"
  else
    debug "yq parsed correctly '$1'"
  fi

  kubeconform_result=$( echo "${yq_result}" | kubeconform "${KUBECONFORM_CONFIG[@]}" )
  if [[ "${PIPESTATUS[0]}" != 0 ]]; then
    error "FAILED - kubeconform result '${kustomize_result}'"
    fatal "FAILED - $1"
  else
    debug "kubeconform validated correctly '$1'"
  fi

  IFS=$'\n' read -d '' -r -a results <<< "${kubeconform_result}"
  debug "Number of results to check '${#results[@]}'"

  for result in "${results[@]}"; do
    debug "Checking individual result - '${result}'"
    if [[ "${result}" =~ ^stdin\ -\ ([A-Za-z0-9\._-]+)\ ([A-Za-z0-9\${}\._-]+)\ is\ valid$ ]]; then
      kind="${BASH_REMATCH[1]}"
      name="${BASH_REMATCH[2]}"
      info "PASSED - '${directory}' '${kind}' '${name}'"
    elif [[ "${result}" =~ ^stdin\ -\ ([A-Za-z0-9\._-]+)\ ([A-Za-z0-9\${}\._-]+)\ skipped$ ]]; then
      kind="${BASH_REMATCH[2]}"
      name="${BASH_REMATCH[1]}"
      info "SKIPPED - '${directory}' '${kind}' '${name}'"
    else
      debug "FAILED - result of kustomize into kubeconform '${result}'"
      fatal "FAILED - '${directory}'"
    fi
  done
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

### Validate YAML ###

if [[ "${#POSITIONAL_ARGS[@]}" -eq 0 ]]; then
  warning "No positional arguments have been given, exiting"
  exit 1
else
  info "Validating yaml files"
fi

for file in "${POSITIONAL_ARGS[@]}"; do
  debug "Checking if '${file}' is a file"
  [[ -f "${file}" ]] || fatal "File not found - '${file}'"
  debug "Validating that '${file}' is a yaml"
  validate_yaml "${file}" || fatal "yq failed to validate '${file}'"
done

### Download Flux schema ###

if [[ ! -d "/tmp/flux-crd-schemas/master-standalone-strict" ]]; then
  info "Creating temporary directory for flux crds schema"
  mkdir -p "/tmp/flux-crd-schemas/master-standalone-strict"
else
  debug "Flux OpenAPI temporary directory already created"
fi
if [[ ! -f "/tmp/flux-crd-schemas/master-standalone-strict/helmrepository-source-v1beta2.json" ]]; then
  info "Downloading Flux OpenAPI schemas"
  if [[ 10 -ge "${LOG_LEVEL}" ]]; then WGET_QUIET="--quiet"; fi
  wget "${WGET_QUIET}" -O "/tmp/flux-crd-schemas/crd-schemas.tar.gz" "https://github.com/fluxcd/flux2/releases/latest/download/crd-schemas.tar.gz"
  tar zxf "/tmp/flux-crd-schemas/crd-schemas.tar.gz" -C "/tmp/flux-crd-schemas/master-standalone-strict"
  rm "/tmp/flux-crd-schemas/crd-schemas.tar.gz" || true
else
  debug "Flux OpenAPI schema appears to be downloaded already"
fi

### Download cert-manager schema ###

if [[ ! -d "/tmp/cert-manager-crd-schemas/master-standalone-strict" ]]; then
  info "Creating temporary directory for cert-manager crds schema"
  mkdir -p "/tmp/cert-manager-crd-schemas/master-standalone-strict"
else
  debug "cert-manager temporary directory already created"
fi
if [[ ! -f "/tmp/cert-manager-crd-schemas/master-standalone-strict/certificate-cert-manager-v1.json" ]]; then
  info "Downloading cert-manager schemas"
  if [[ 10 -ge "${LOG_LEVEL}" ]]; then WGET_QUIET="--quiet"; fi
  wget "${WGET_QUIET}" -O "/tmp/cert-manager-crd-schemas/crds-cert-manager.yaml" "https://github.com/cert-manager/cert-manager/releases/download/v1.14.4/cert-manager.crds.yaml"
  yq 'select(documentIndex == 0)' --output-format json "/tmp/cert-manager-crd-schemas/crds-cert-manager.yaml" > "/tmp/cert-manager-crd-schemas/master-standalone-strict/certificaterequest-cert-manager-v1.json"
  yq 'select(documentIndex == 1)' --output-format json "/tmp/cert-manager-crd-schemas/crds-cert-manager.yaml" > "/tmp/cert-manager-crd-schemas/master-standalone-strict/certificate-cert-manager-v1.json"
  yq 'select(documentIndex == 2)' --output-format json "/tmp/cert-manager-crd-schemas/crds-cert-manager.yaml" > "/tmp/cert-manager-crd-schemas/master-standalone-strict/challenge-cert-manager-v1.json"
  yq 'select(documentIndex == 3)' --output-format json "/tmp/cert-manager-crd-schemas/crds-cert-manager.yaml" > "/tmp/cert-manager-crd-schemas/master-standalone-strict/clusterissuer-cert-manager-v1.json"
  yq 'select(documentIndex == 4)' --output-format json "/tmp/cert-manager-crd-schemas/crds-cert-manager.yaml" > "/tmp/cert-manager-crd-schemas/master-standalone-strict/issuer-cert-manager-v1.json"
  yq 'select(documentIndex == 5)' --output-format json "/tmp/cert-manager-crd-schemas/crds-cert-manager.yaml" > "/tmp/cert-manager-crd-schemas/master-standalone-strict/order-cert-manager-v1.json"
  rm "/tmp/cert-manager-crd-schemas/crds-cert-manager.yaml" || true
else
  debug "cert-manager schema appears to be downloaded already"
fi

### Kubeconform Cluster ###

CLUSTER_YAML=()
for file in "${POSITIONAL_ARGS[@]}"; do
  if [[ "${file}" =~ ^clusters\/.+\/[[:alnum:]]+\.yaml$ ]]; then
    debug "Found '${file}' to be a Flux cluster yaml file"
    CLUSTER_YAML+=( "${file}" )
  else
    debug "Not a Flux cluster yaml file '${file}'"
  fi
done

if [[ "${#CLUSTER_YAML[@]}" -gt 0 ]]; then
  info "Validating Flux cluster kustomizations"
  for file in "${CLUSTER_YAML[@]}"; do
    debug "Validating that '${file}' is a Flux kustomization file"
    kubeconform_validate "${file}"
  done
else
  debug "No Flux cluster kustomizations to validate"
fi

### Kubeconform Overlay ###

KUSTOMIZE_DIRS=()
KUSTOMIZE_SET_DIRS=()
info "Finding kustomizations"
for file in "${POSITIONAL_ARGS[@]}"; do
  directory="$( dirname "${file}" )"
  kustomization_file="$( printf '%s/kustomization.yaml' "${directory}" )"
  debug "Checking that '${kustomization_file}' an actual file"
  [[ -f "${kustomization_file}" ]] || continue
  debug "Found '${kustomization_file}' to be a kustomization yaml file"
  validate_yaml "${kustomization_file}" || continue
  debug "Adding '${directory}' to build kustomize against"
  KUSTOMIZE_DIRS+=( "${directory}" )
done

debug "Removing duplicate entries - '${KUSTOMIZE_DIRS[*]}'"
remove_duplicates "${KUSTOMIZE_DIRS[@]}"
debug "Set of kustomization directories - '${KUSTOMIZE_SET_DIRS[*]}'"

if [[ "${#KUSTOMIZE_SET_DIRS[@]}" -gt 0 ]]; then
  info "Validating kustomization overlays"
  for directory in "${KUSTOMIZE_SET_DIRS[@]}"; do
    debug "Validating that '${directory}' is a valid kustomize build directory"
    [[ ! "${directory}" =~ ^clusters\/[[:alnum:]]\/flux-system$ ]] || continue
    kustomize_validate "${directory}"
  done
else
  debug "No kustomize overlays to validate"
fi

debug "End of script"
