#!/bin/bash

DEFAULT_DNS="$(hostname -I | awk '{print $1}'| tr '.' '-' | awk {'print $1 ".ip.linodeusercontent.com"'})"

declare -A UDF_VARS
UDF_VARS["USER_NAME"]="admin"
UDF_VARS["SOA_EMAIL_ADDRESS"]="webmaster@${DEFAULT_DNS}"
UDF_VARS["DISABLE_ROOT"]="No"
UDF_VARS["SUBDOMAIN"]=""
UDF_VARS["DOMAIN"]=""
UDF_VARS["WEBSERVER_STACK"]="lamp"
UDF_VARS["SITE_TITLE"]="Joes Musical Adventure"
UDF_VARS["WP_ADMIN_USER"]="admin"
UDF_VARS["WP_DB_USER"]="wordpress"
UDF_VARS["WP_DB_NAME"]="wp"
UDF_VARS["PROMETHEUS_EXPORTER"]="none"

set_vars() {
  for key in "${!UDF_VARS[@]}"; do
    export "${key}"="${UDF_VARS[$key]}"
  done
}

# main
set_vars
