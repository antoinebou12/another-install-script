#!/usr/bin/env bash
#
# @file heimdall.sh
# @brief to install docker heimdall


# @description create docker heimdall
# https://hub.docker.com/r/linuxserver/heimdall/
# @args $1 PATH_CONFIG
# @args $2 PORT_WEB
# @args $3 PORT_WEB_HTTPS
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_heimdall(){
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8080"
    
    return 0
}

# @description remove docker heimdall
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_heimdall() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}