#!/usr/bin/env bash

# @file shidori.sh
# @brief to install docker shidori



# @description create docker shidori
# not implemented yet
# https://github.com/MohammadAlHajj/shidori
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_shidori(){
    PORT_WEB=${1:-"8006"}
    docker --name shidori -d -p "PORT_WEB":8080 radhifadlillah/shiori
    echo "not implemented yet"
    return 0
}
