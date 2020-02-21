#!/usr/bin/env bash

# @file qbittorrent-vpn.sh
# @brief to install docker qbittorrent-vpn



# @description create docker qbittorrent-vpn
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_qbittorrent-vpn(){
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d
    return 0
}