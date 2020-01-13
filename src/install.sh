#!/bin/bash
#
# @file Title of file script
# @brief Small description of the script.


function install-basic(){
    set -e
    apt-get -q update
    apt-get -q install bat nnn nmap wget curl bats mlocate
}