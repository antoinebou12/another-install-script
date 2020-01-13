#!/bin/bash
#
# @file Install bac
# @brief Small description of the script.


function install_basic(){
    # apt-get ubuntu 18.04
    apt-get update -qq -y
    apt-get install -y bat nnn nmap wget curl bats mlocate heirloom-mailx python3 python3-pip

    # snap package
    snap install hub
}