#!/usr/bin/env bash

# @file paperless.sh
# @brief to install docker paperless

# @description create docker paperless
# not implemented yet
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_paperless() {
    exec_root docker-compose up -d
    echo "not implemented yet"
    return 0
}

# @description remove docker paperless
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_paperless() {
    echo "not implemented"
    return 0
}