#!/usr/bin/env bash

# @file guacamole.sh
# @brief to install docker guacamole



# @description create docker guacamole
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_guacamole(){

    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

    exec_root docker restart guacamole

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8012"
    echo "username: guacadmin"
    echo "password: guacadmin"

    return 0
}

# @description remove docker guacamole
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_guacamole() {
    echo "not implemented"
    return 0
}