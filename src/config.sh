#!/usr/bin/env bash
#
# @file config.sh
# @brief file containing the utils  for the project and other

# @description Read YML file from Bash script
# https://gist.github.com/pkuczynski/8665367
# @noargsW
# @exitcode 0 If successfull.
# @exitcode 1 On failure
parse_yml() {
    local prefix=$2
    local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @ | tr @ '\034')
    sed -ne "s|^\($s\)\($w\)$s:$s\"\(.*\)\"$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p" $1 |
        awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=%s\n", "'"$prefix"'",vn, $2, $3);
      }
    }'
}

# @description get value for yml
#
# @args $1 variable path name
# @exitcode 0 If successfull.
# @exitcode 1 On failure
read_config_yml() {
    parse_yml "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/../config.yml" | grep "$1" | cut -d '=' -f 2-
    return 0
}

# @description read config file
# https://unix.stackexchange.com/questions/175648/use-config-file-for-my-shell-script
# @arg $1 the config fiel path
# @exitcode 0 If successfull.
# @exitcode 1 On failure
config_read_file() {
    (grep -E "^${2}=" -m 1 "${1}" 2>/dev/null || echo "VAR=__UNDEFINED__") | head -n 1 | cut -d '=' -f 2-
    return 0
}

# @description get config var from a spefic file
# https://unix.stackexchange.com/questions/175648/use-config-file-for-my-shell-script
# @arg $1 the config file path
# @arg $2 the config file var
# @exitcode 0 If successfull.
# @exitcode 1 On failure
config_get() {
    # shellcheck disable=SC2086
    val="$(config_read_file ${1} ${2})"
    if [ "${val}" = "__UNDEFINED__" ]; then
        # shellcheck disable=SC2086
        val="$(config_read_file config.cfg.defaults ${2})"
    fi
    printf -- "%s\n" "${val}"
    return 0
}

# @description get config var array into a list ports
# @arg $1 the config file var array
# @exitcode 0 If successfull.
# @exitcode 1 On failure
parse_yml_array_ports() {
    local ARRAY
    local NEW_ARRAY
    local VALUES
    ARRAY="$(read_config_yml "$1""_ports")"
    NEW_ARRAY="${ARRAY//\"/}"
    if [[ "$NEW_ARRAY" == *"["*"]"* ]]; then
        VALUES="$(echo "$NEW_ARRAY" | jq -c '.[]')"
        printf -- "%s\n" "${VALUES}"
        return 0
    else
        return 1
    fi
}

# @description get config var array into a list web
# @arg $1 the config file var array
# @exitcode 0 If successfull.
# @exitcode 1 On failure
parse_yml_array_web() {
    local ARRAY
    local NEW_ARRAY
    ARRAY="$(read_config_yml "$1""_web")"
    NEW_ARRAY="${ARRAY//]/}"
    NEW_ARRAY="${NEW_ARRAY//[/}"
    NEW_ARRAY="${NEW_ARRAY//,/
}" # newline
    NEW_ARRAY="${NEW_ARRAY//\"/}"
    printf -- "%s\n" "${NEW_ARRAY}"
    return 0
}

# @description generate the container url on the server
# @arg $1 container name
# @exitcode 0 If successfull.
# @exitcode 1 On failure
container_url() {
    local WEBPORT
    local DOMAIN
    WEBPORT="$(parse_yml_array_web "$1")"
    DOMAIN="$(read_config_yml "system_domain")"
    printf "%s%s\n" "$DOMAIN" "$WEBPORT"
    return 0
}

# @description generate the subdomain container url on the server
# @arg $1 container name
# @exitcode 0 If successfull.
# @exitcode 1 On failure
subdomain_container_url() {
    local CONTAINER
    local DOMAIN
    CONTAINER="$(read_config_yml "$1""_name")"
    DOMAIN="$(read_config_yml "system_domain")"
    printf "%s.%s\n" "${CONTAINER//\"/}" "${DOMAIN//\"/}"
    return 0
}
