#!/bin/bash
#
# @file Title of file script
# @brief Small description of the script.

# import 
source func-lib.sh


# @description install the docker
#
# @noargs
function install-docker(){
    set -e
    apt-get -q remove docker docker-engine docker.io containerd runc
    apt-get -q install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
}

function install-docker-compose(){
    set -e
    curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
}

function install-extra-docker(){
    set -e
    curl -sSf https://moncho.github.io/dry/dryup.sh |  sh
}

