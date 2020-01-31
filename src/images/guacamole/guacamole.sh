#!/usr/bin/env bash

# @file guacamole.sh
# @brief to install docker guacamole



# @description create docker guacamole
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_guacamole(){
    PORT_WEB=${1:-8003}
    PATH_CONFIG=${2:-/home/udocker/volumes/guacamole/config}
    
    udocker_create_dir "$PATH_CONFIG"

    docker run --name guacamole -d -p "$PORT_WEB":8080 -v "$PATH_CONFIG":/config oznu/guacamole
    docker restart guacamole

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):${PORT_WEB}"
    echo "username: guacadmin"
    echo "password: guacadmin"

    return 0
}