#!/usr/bin/env bash
#
# @file jenkins.sh
# @brief to install docker jenkins


# @description create docker jenkins
# https://github.com/jenkinsci/docker
# @args $1 port number for the web server
# @args $2 port number for jenkins server
# @args $3 the path to jenkins data volume
# @exitcode 0 If successfull.
# @exitcode 1 On failure
 create_docker_jenkins(){
    PORT_WEB=${1:-8080}
    PORT_JENKINS=${2:-50000}
    JENKINS_DATA=${3:-"/home/udocker/volumes/jenkins"}

    exec_root mkdir -p "$JENKINS_DATA"
    exec_root chmod 755 "$JENKINS_DATA"
    exec_root chown udocker:udocker "$JENKINS_DATA"

    docker run -d -p "$PORT_WEB":8080 -p "$PORT_JENKINS":50000 -v "$JENKINS_DATA":/var/jenkins_home jenkins/jenkins:lts
    return 0
}