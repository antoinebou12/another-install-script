#!/usr/bin/env bash

# @file piwigo.sh
# @brief to install docker piwigo

# @description create docker piwigo
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_piwigo() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8049"
    return 0
}

# @description remove docker piwigo
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_piwigo() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}
