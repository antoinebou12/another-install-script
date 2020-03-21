#!/usr/bin/env bash
# @file dashmachine.sh
# @brief to install docker dashmachine


# @description create docker dashmachine
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_dashmachine(){
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d
    
    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):5000"

    return 0
}

# @description remove docker dashmachine
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_dashmachine() {
    echo "not implemented"
    return 0
}