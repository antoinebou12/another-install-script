#!/usr/bin/env bash

# @file neko.sh
# @brief to install docker neko

# @description create docker neko
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_neko() {
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8032"

    return 0
}
