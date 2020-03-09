#!/usr/bin/env bash

# @file sonarr.sh
# @brief to install docker sonarr

# @description create docker sonarr
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_sonarr() {
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8989"

    return 0
}
