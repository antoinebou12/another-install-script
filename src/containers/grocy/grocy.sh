#!/usr/bin/env bash

# @file grocy.sh
# @brief to install docker grocy

# @description create docker grocy
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_grocy() {

    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):9283"

    return 0
}

# @description remove docker grocy
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_grocy() {
    echo "not implemented"
    return 0
}
