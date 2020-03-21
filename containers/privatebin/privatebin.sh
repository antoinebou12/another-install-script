#!/usr/bin/env bash

# @file privatebin.sh
# @brief to install docker privatebin

# @description create docker privatebin
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_privatebin() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8052"

    return 0
}

# @description remove docker privatebin
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_privatebin() {
    echo "not implemented"
    return 0
}
