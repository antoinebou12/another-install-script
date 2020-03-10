#!/usr/bin/env bash

# @file netdata.sh
# @brief to install docker netdata

# @description create docker netdata
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_netdata() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):19999"

    return 0
}

# @description remove docker netdata
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_netdata() {
    echo "not implemented"
    return 0
}