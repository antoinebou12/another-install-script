#!/usr/bin/env bash
#
# @file jenkins.sh
# @brief to install docker jenkins


# @description create docker jenkins
# https://github.com/jenkinsci/docker
# @args $1 port number for the web server
# @args $1 port number for jenkins server
# @args $1 the path to jenkins data volume
# @exitcode 0 If successfull.
# @exitcode 1 On failure
fucntion create_docker_jenkins(){
    local port_web=${1:-8080}
    local port_jenkins=${2:-25565}
    local jenkins_data=${3:-25565}
    docker run -p $port_web:8080 -p $port_jenkins:50000 -v $jenkins_data:/var/jenkins_home jenkins/jenkins:lts
    return 0
}