#!/usr/bin/env bash

# @file huginn.sh
# @brief to install docker huginn

# @description create docker huginn
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_huginn() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8013"
    return 0
}

# @description remove docker huginn
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_huginn() {
    echo "not implemented"
    return 0
}
