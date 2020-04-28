#!/usr/bin/env bash

# @file rocketchat.sh
# @brief to install docker rocketchat

# @description create docker rocketchat
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_rocketchat() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d
    return 0
}

# @description remove docker rocketchat
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_rocketchat() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}