#!/usr/bin/env bash

# @file minecraft.sh
# @brief to install docker minecraft

# @description create docker minecraft
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_minecraft() {
     docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d
     return 0
}

# @description remove docker minecraft
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_minecraft() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}