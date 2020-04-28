#!/usr/bin/env bash

# @file mylar.sh
# @brief to install docker mylar

# @description create docker mylar
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_mylar() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8090"

    return 0
}

# @description remove docker mylar
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_mylar() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}
