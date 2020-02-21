#!/usr/bin/env bash
#
# @file jupyterhub.sh
# @brief to install docker jupyterhub


# @description create docker jupyterhub
# https://github.com/jupyterhub/jupyterhub-deploy-docker
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_jupyter_hub(){
    docker-compose -f "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/docker-compose.yml" up -d
    
    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8888"

    return 0
}

