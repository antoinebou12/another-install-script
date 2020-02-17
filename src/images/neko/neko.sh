#!/usr/bin/env bash

# @file neko.sh
# @brief to install docker neko

# @description create docker neko
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_neko() {
    docker-compose up -d
    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):${PORT_WEB}"

    return 0
}
