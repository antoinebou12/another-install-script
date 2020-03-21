#!/usr/bin/env bash

# @file drawio.sh
# @brief to install docker drawio

# @description create docker drawio
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_drawio() {
    
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8005"
    return 0
}

# @description remove docker drawio
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_drawio() {
    echo "not implemented"
    return 0
}