#!/usr/bin/env bash

# @file plex.sh
# @brief to install docker plex

# @description create docker plex
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_plex() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d
    return 1
}

# @description remove docker plex
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_plex() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}