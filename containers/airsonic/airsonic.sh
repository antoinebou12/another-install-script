#!/usr/bin/env bash

# @file airsonic.sh
# @brief to install docker airsonic

# @description create docker airsonic
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_airsonic() {

    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):4040"

    return 0
}

# @description remove docker airsonic
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_airsonic() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}
