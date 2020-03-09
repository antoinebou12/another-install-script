#!/usr/bin/env bash

# @file osjs.sh
# @brief to install docker osjs

# @description create docker osjs
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_osjs() {
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):7999"

    return 0
}
