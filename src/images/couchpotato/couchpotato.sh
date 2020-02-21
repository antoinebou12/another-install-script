#!/usr/bin/env bash

# @file couchpotato.sh
# @brief to install docker couchpotato

# @description create docker couchpotato
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_couchpotato() {
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):5050"

    return 0
}
