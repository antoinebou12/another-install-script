#!/bin/bash
#
# @file test.sh
# @brief run bats test

#import
source "$(dirname "${BASH_SOURCE[0]}")/../src/utils.sh"
source "$(dirname "${BASH_SOURCE[0]}")/../src/docker/docker.sh"


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
    bats "$(dirname "${BASH_SOURCE[0]}")/bats/utils.bats"
    bats "$(dirname "${BASH_SOURCE[0]}")/bats/docker.bats"
}

install_bats
run_tests
