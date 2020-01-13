#!/bin/bash
#
# @file Title of file script
# @brief Small description of the script.

# import 
source func-lib.sh


# @description install the docker
#
# @noargs
function install_docker(){
    echo "Install Docker"
    apt-get remove -y docker docker-engine docker.io containerd runc
    apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update -qq -y
}


# @description install the docker compose
#
# @noargs
function install-docker_compose(){
    echo "Install Docker"
    curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
}


# @description install the docker extra utils
#
# @noargs
function install_docker_extra(){
    curl -sSf https://moncho.github.io/dry/dryup.sh |  sh
}

