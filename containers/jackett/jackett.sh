#!/usr/bin/env bash

# @file jackett.sh
# @brief to install docker jackett

# @description create docker jackett
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_jackett() {
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):9117"
    return 0
}

# @description remove docker jackett
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_jackett() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}