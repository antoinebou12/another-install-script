#!/usr/bin/env bash
#
# @file jupyterhub.sh
# @brief to install docker jupyterhub


# @description create docker jupyterhub
# https://github.com/jupyterhub/jupyterhub-deploy-docker
# @args $1 port number for the web server
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_jupyter_hub(){
    exec_root JUPYTERHUB_PORT=$1 docker-compose up -d
    return 0
}

