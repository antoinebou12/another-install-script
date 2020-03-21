#!/usr/bin/env bash

# @file qbittorrentvpn.sh
# @brief to install docker qbittorrentvpn

# @description create docker qbittorrentvpn
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_qbittorrentvpn() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d
    return 0
}

# @description remove docker qbittorrentvpn
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_qbittorrentvpn() {
    echo "not implemented"
    return 0
}
