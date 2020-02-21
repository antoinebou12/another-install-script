#!/usr/bin/env bash

# @file liberapay.sh
# @brief to install docker liberapay

# @description create docker liberapay
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_liberapay() {
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8339"
    return 0
}
