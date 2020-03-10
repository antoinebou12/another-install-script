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
    bats "bats/config.bats"
    bats "bats/containers.bats"
    bats "bats/docker.bats"
    bats "bats/firewall.bats"
    bats "bats/install.bats"
    bats "bats/menu.bats"
    bats "bats/utils.bats"
    bats "bats/other.bats"
    bats "bats/router.bats"
    return 0
}

run_tests
