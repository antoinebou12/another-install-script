#!/usr/bin/env bash
#
# @file jupyterhub.sh
# @brief to install docker jupyterhub

# @description create docker jupyterhub
# https://github.com/jupyterhub/jupyterhub-deploy-docker
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_jupyterhub() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "Please wait ..."
    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8015"
    return 0
}

# @description remove docker jupyterhub
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_jupyterhub() {
    echo "not implemented"
    return 0
}
