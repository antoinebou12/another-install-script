#!/usr/bin/env bash

# @file cyberchef.sh
# @brief to install docker cyberchef

# @description create docker cyberchef
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_cyberchef() {

    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8004"
    return 0
}

# @description remove docker cyberchef
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_cyberchef() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}
