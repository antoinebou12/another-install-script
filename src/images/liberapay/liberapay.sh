#!/usr/bin/env bash

# @file liberapay.sh
# @brief to install docker liberapay

# @description create docker liberapay
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_liberapay() {

    CURRENT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
    git clone https://github.com/liberapay/liberapay.com.git "$CURRENT_DIRECTORY/liberapay"
    pushd "$CURRENT_DIRECTORY/liberapay"
    
    docker-compose up -d

    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8339"

    popd
    unset CURRENT_DIRECTORY
    return 0
}
