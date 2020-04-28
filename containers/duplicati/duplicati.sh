#!/usr/bin/env bash

# @file duplicati.sh
# @brief to install docker duplicati

# @description create docker duplicati
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_duplicati() {
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):4040"

    return 0
}

# @description remove docker duplicati
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_duplicati() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}
