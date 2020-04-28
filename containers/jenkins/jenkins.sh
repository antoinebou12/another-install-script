#!/usr/bin/env bash
#
# @file jenkins.sh
# @brief to install docker jenkins

# @description create docker jenkins
# https://github.com/jenkinsci/docker
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_jenkins() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" up -d

    echo "Please wait ..."
    echo "ctrl+click to open in browser"
    echo "$(get_current_ip):8015"

    sleep 60
    echo "Admin Password:"
    docker container exec -it jenkins cat /var/jenkins_home/secrets/initialAdminPassword
    return 0
}

# @description remove docker jenkins
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_docker_jenkins() {
    docker-compose -f "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker-compose.yml" down
    return 0
}
