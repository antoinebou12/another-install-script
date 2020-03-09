#!/usr/bin/env bash

# @file open-streaming-platform.sh
# @brief to install docker open-streaming-platform

# @description create docker open-streaming-platform
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_open-streaming-platform() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8585"

    return 0
}

# @description remove docker open-streaming-platform
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_open-streaming-platform() {
    echo "not implemented"
    return 0
}