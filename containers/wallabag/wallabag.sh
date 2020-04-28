#!/usr/bin/env bash

# @file wallabag.sh
# @brief to install docker wallabag

# @description create docker wallabag
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_wallabag() {

    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8899"

    return 1
}

# @description remove docker wallabag
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_wallabag() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}