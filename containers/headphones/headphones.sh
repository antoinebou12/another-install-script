#!/usr/bin/env bash

# @file headphones.sh
# @brief to install docker headphones

# @description create docker headphones
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_headphones(){

    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8181"

    return 0
}

# @description remove docker headphones
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_headphones() {
    echo "not implemented"
    return 0
}