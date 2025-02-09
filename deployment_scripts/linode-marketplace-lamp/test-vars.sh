#!/bin/bash

# original author of this file: rylabs-billy

declare -A UDF_VARS
UDF_VARS["USER_NAME"]="admin"
UDF_VARS["SOA_EMAIL_ADDRESS"]="webmaster@example.com"
UDF_VARS["DISABLE_ROOT"]="No"
UDF_VARS["SUBDOMAIN"]=""
UDF_VARS["DOMAIN"]=""

set_vars() {
  for key in "${!UDF_VARS[@]}"; do
    export "${key}"="${UDF_VARS[$key]}"
  done
}

# main
set_vars
