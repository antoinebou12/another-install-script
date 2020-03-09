#!/usr/bin/env bash
#
# @file router.sh
# @brief file containing the router for traefik and subdomain for docker containers


# @description install_reverse_proxy
#
# @args $# the backup of all the container names
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_reverse_proxy() {
    echo "install_reverse_proxy"
    return 1
}

# @description add_subdomain
#
# @args $# the backup of all the container names
# @exitcode 0 If successfull.
# @exitcode 1 On failure
add_subdomain() {
    echo "add_subdomain"
    return 1
}