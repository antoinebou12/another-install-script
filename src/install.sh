#!/bin/bash
#
# @file Title of file script
# @brief Small description of the script.


function install-basic(){
    apt-get update
    apt-get install bat nnn nmap wget curl bats mlocate
}