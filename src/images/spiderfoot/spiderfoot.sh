#!/usr/bin/env bash

# @file spiderfoot.sh
# @brief to install docker spiderfoot

# @description create docker spiderfoot
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_spiderfoot() {
    CURRENT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    docker build spiderfoot -f "$CURRENT_DIRECTORY/Dockerfile" "$CURRENT_DIRECTORY"
    docker-compose -f "$CURRENT_DIRECTORY/docker-compose.yml" up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):5001"
    echo "or"

    source "$CURRENT_DIRECTORY/../../utils.sh"
    aptinstall python python-pip
    wget https://raw.githubusercontent.com/smicallef/spiderfoot/master/sfcli.py -O /home/udocker/spiderfoot/sfcli.py
    echo "python /home/udocker/spiderfoot/sfcli.py -s http://localhost:5001"
    unset CURRENT_DIRECTORY
    return 0
}

# @description remove docker spiderfoot
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_spiderfoot() {
    echo "not implemented"
    return 0
}
