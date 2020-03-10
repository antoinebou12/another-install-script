#!/usr/bin/env bash
# @file jellyfin.sh
# @brief to install docker jellyfin

# @description create docker jellyfin
# https://github.com/linuxserver/docker-jellyfin
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_jellyfin() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8096"

    return 0
}

# @description remove docker jellyfin
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_jellyfin() {
    echo "not implemented"
    return 0
}
