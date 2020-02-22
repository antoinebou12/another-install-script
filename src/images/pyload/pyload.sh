#!/usr/bin/env bash
#
# @file pyload.sh
# @brief to install docker pyload

# @description create docker syncthing
# https://github.com/linuxserver/docker-pyload/issues/3
# @args $1 PATH_CONFIG
# @args $2 PATH_DOWNLOAD
# @args $3 PORT_WEB
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_pyload() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8053"
    return 0
}
