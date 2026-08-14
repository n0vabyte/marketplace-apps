#!/bin/bash
# CI UDF defaults for discourse. Sourced before the deploy script so required UDF vars
# have sensible values when not explicitly set.

DEFAULT_DNS="$(hostname -I | awk '{print $1}' | tr '.' '-' | awk '{print $1 ".ip.linodeusercontent.com"}')"

declare -A UDF_VARS

if [[ -n "${USER_NAME:-}" ]]; then UDF_VARS["USER_NAME"]="${USER_NAME}"; else UDF_VARS["USER_NAME"]="admin"; fi
if [[ -n "${DISABLE_ROOT:-}" ]]; then UDF_VARS["DISABLE_ROOT"]="${DISABLE_ROOT}"; else UDF_VARS["DISABLE_ROOT"]="No"; fi
if [[ -n "${SUBDOMAIN:-}" ]]; then UDF_VARS["SUBDOMAIN"]="${SUBDOMAIN}"; else UDF_VARS["SUBDOMAIN"]="${DEFAULT_DNS%%.*}"; fi
if [[ -n "${DOMAIN:-}" ]]; then UDF_VARS["DOMAIN"]="${DOMAIN}"; else UDF_VARS["DOMAIN"]=""; fi
if [[ -n "${ADMIN_EMAIL:-}" ]]; then UDF_VARS["ADMIN_EMAIL"]="${ADMIN_EMAIL}"; else UDF_VARS["ADMIN_EMAIL"]="admin@${DEFAULT_DNS#*.}"; fi
if [[ -n "${SMTP_ADDRESS:-}" ]]; then UDF_VARS["SMTP_ADDRESS"]="${SMTP_ADDRESS}"; else UDF_VARS["SMTP_ADDRESS"]=""; fi
if [[ -n "${SMTP_PORT:-}" ]]; then UDF_VARS["SMTP_PORT"]="${SMTP_PORT}"; else UDF_VARS["SMTP_PORT"]="587"; fi
if [[ -n "${SMTP_USER_NAME:-}" ]]; then UDF_VARS["SMTP_USER_NAME"]="${SMTP_USER_NAME}"; else UDF_VARS["SMTP_USER_NAME"]=""; fi
if [[ -n "${SMTP_PASSWORD:-}" ]]; then UDF_VARS["SMTP_PASSWORD"]="${SMTP_PASSWORD}"; else UDF_VARS["SMTP_PASSWORD"]=""; fi
if [[ -n "${ADD_ONS:-}" ]]; then UDF_VARS["ADD_ONS"]="${ADD_ONS}"; else UDF_VARS["ADD_ONS"]="none"; fi

set_vars() {
	for key in "${!UDF_VARS[@]}"; do
		export "${key}"="${UDF_VARS[$key]}"
	done
}

set_vars
