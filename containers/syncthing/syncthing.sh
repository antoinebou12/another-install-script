#!/usr/bin/env bash
#
# @file syncthing.sh
# @brief to install docker syncthing

# @description create docker syncthing
# https://github.com/syncthing/syncthing

# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_syncthing() {

    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8384"
    return 0
}

# @description remove docker syncthing
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_syncthing() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}
