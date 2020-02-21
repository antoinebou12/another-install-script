#!/usr/bin/env bash
#
# @file firefly-iii.sh
# @brief to install docker firefly-iii


# @description create docker firefly-iii
# https://github.com/firefly-iii/docker
# @args $1 PORT_WEB
# @args $2 PATH_DB
# @args $3 PATH_EXPORT
# @args $4 PATH_UPLOAD
# @args $4 POSTGRES_PASSWORD
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_firefly-iii(){
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8006"

    return 0
}