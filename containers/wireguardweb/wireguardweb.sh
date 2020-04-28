#!/usr/bin/env bash

# @file wireguardweb.sh
# @brief to install docker wireguardweb

# @description create docker wireguardweb
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_wireguardweb() {

    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):"

    return 0
}

# @description remove docker wireguardweb
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_wireguardweb() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}