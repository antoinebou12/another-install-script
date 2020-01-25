#!/bin/bash
#
# @file test.sh
# @brief run bats test

#import
DIR=`dirname "$BASH_SOURCE"`
source "$DIR"/../src/utils.sh
source "$DIR"/../src/docker/docker.sh


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
    bats "$DIR"/bats/utils.bats
    bats "$DIR"/bats/docker.bats
}

install_bats
run_tests
