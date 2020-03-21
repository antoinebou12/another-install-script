#!/usr/bin/env bash

# @file freshrss.sh
# @brief to install docker freshrss

# @description create docker freshrss
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_freshrss() {

    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8007"
    return 0
}

# @description remove docker freshrss
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_freshrss() {
    echo "not implemented"
    return 0
}