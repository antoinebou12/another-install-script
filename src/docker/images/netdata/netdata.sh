#!/usr/bin/env bash

# @file netdata.sh
# @brief to install docker netdata



# @description create docker netdata
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_netdata(){
    set -e
    local PORT_WEB=${1:-19999}
    cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
    docker-compose up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):${PORT_WEB}"

    exit 1
    return 0
}