#!/usr/bin/env bash

# @file code-server.sh
# @brief to install docker code-server

# @description create docker code-server
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_code-server() {
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8003"
    return 0
}
