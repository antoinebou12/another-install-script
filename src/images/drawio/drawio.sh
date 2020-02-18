#!/usr/bin/env bash

# @file drawio.sh
# @brief to install docker drawio

# @description create docker drawio
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_drawio() {
    
    docker-compose -d -f "$(dirname "${BASH_SOURCE[0]}")/docker-compose.yml" up

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):${PORT_WEB}"
    return 0
}
