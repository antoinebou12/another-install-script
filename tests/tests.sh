#!/bin/bash
#
# @file test.sh
# @brief run bats test

source "$(dirname "${BASH_SOURCE[0]}")/../src/utils.sh"

install_bats(){
    if [[ ! $(command -v bats) ]]; then
        aptinstall bats
    fi
    return 0
}

run_tests(){
    install_bats
    pushd bats || exit
    bats "config.bats"
    # bats "containers.bats"
    # bats "docker.bats"
    # bats "firewall.bats"
    # bats "install.bats"
    # bats "menu.bats"
    bats "utils.bats"
    bats "other.bats"
    # bats "router.bats"
    popd || exit
    return 0
}

run_tests
