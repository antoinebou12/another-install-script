#!/usr/bin/env bash
# @file linkd.sh
# @brief to install docker linkd

# @description create docker linkd
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_linkd() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "check documentation https://github.com/HexF/linkd"

    return 0
}

# @description remove docker linkd
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_linkd() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}
