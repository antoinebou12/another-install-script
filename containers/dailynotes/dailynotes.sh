#!/usr/bin/env bash
# @file dailynotes.sh
# @brief to install docker dailynotes


# @description create docker dailynotes
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_dailynotes(){
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d
    
    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):5000"

    return 0
}

# @description remove docker dailynotes
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_dailynotes() {
    echo "not implemented"
    return 0
}