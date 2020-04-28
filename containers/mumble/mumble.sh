#!/usr/bin/env bash

# @file mumble.sh
# @brief to install docker mumble

# @description create docker mumble
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_mumble() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d
    return 0
}

# @description remove docker mumble
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_mumble() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}