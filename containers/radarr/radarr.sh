#!/usr/bin/env bash

# @file radarr.sh
# @brief to install docker radarr

# @description create docker radarr
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_radarr() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):7878"

    return 0
}

# @description remove docker radarr
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_radarr() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}
