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
function create_docker_jenkins(){
    local PORT_WEB=${1:-8080}
    local PORT_JENKINS=${2:-25565}
    local JENKINS_DATA=${3:"/home/docker/jenkins"}
    docker run -p "$PORT_WEB":8080 -p "$PORT_JENKINS":50000 -v "$JENKINS_DATA":/var/jenkins_home jenkins/jenkins:lts
    return 0
}