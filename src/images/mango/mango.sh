#!/usr/bin/env bash

# @file mango.sh
# @brief to install docker mango


# @description create docker mango
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_lychee(){
     docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d

     echo "ctrl+click to open in browser"
     echo "$(get_current_ip):8036"
     return 0
}