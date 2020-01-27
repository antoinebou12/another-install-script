#!/bin/bash
#
# @file test.sh
# @brief run bats test

install_bats(){
    if [[ ! $(command -v bats) ]]; then
        if  [[ "$UID" -gt 0 ]]; then
            sudo apt-get install bats
        else
            apt-get install bats
        fi
    fi
    return 0
}

run_tests(){
    install_bats

    bats "bats/utils.bats"
    bats "bats/docker.bats"
    bats "bats/containers.bats"
    bats "bats/install.bats"
    bats "bats/menu.bats"
    unset CURRENT_DIR
    return 0
}

run_tests
