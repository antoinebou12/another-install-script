#!/usr/bin/env bash

# @file traefik
# @brief to install docker traefik

# @description create docker traefik
# link
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_traefik() {
    echo "Make sure to add the A record of your DNS '* <YOUR IP>' "
    return 0
}

# @description remove docker traefik
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_traefik() {
    echo "not implemented"
    return 0
}
