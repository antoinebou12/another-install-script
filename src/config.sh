#!/usr/bin/env bash
#
# @file config.sh
# @brief file containing the utils  for the project and other

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
    printf -- "%s" "${val}"
    return 0
}