#!/usr/bin/env bash
#
# @file docker.sh
# @brief to install docker docker compose on ubuntu18.04

# import
# shellcheck source=../utils.sh
# shellcheck disable=SC1091
source "$(dirname "${BASH_SOURCE[0]}")/../utils.sh"

# @description install the docker
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_docker() {
    echo "Install Docker"
    print_line

    # curl -sSL https://get.docker.com/ | CHANNEL=stable bash
    aptremove docker docker-engine docker.io containerd runc
    aptinstall apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | exec_root "apt-key add -"
    exec_root "apt-key fingerprint 0EBFCD88"
    dqt='"'
    exec_root "add-apt-repository ${dqt}deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable${dqt}"
    aptupdate
    aptinstall docker-ce docker-ce-cli containerd.io
    aptclean

    print_line
    return 0
}

# @description install the docker compose
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install-docker_compose() {
    echo "Install Docker Compose"
    print_line

    curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

    print_line
    return 0
}

# @description install the docker extra utils dry
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_docker_extra() {
    echo "Install Docker Extra"
    print_line

    curl -sSf https://moncho.github.io/dry/dryup.sh | exec_root "sh"

    print_line
    return 0
}

# @description prune all the volumes and images
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
prune_images_volumes_all() {
    echo "Prune all Docker Images Volumes"
    print_line

    docker image prune -a
    docker system prune --volumes

    print_line
    return 0
}

# @description stop all container
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
stop_containers_all() {
    echo "Stop all Docker Containers"
    print_line

    docker container stop "$(docker container ls -aq)"

    print_line
    return 0
}

# @description stop all container
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_containers_all() {
    echo "Remove all Docker Containers"
    print_line

    docker rm $(docker ps -a -q)

    print_line
    return 0
}

# @description this  creates the volumes, services and backup directories. It then assisgns the current user to the ACL to give full read write access
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
docker_setfacl() {
    echo "Create Folder for Docker User"
    print_line

    [ -d /home/docker/services ] || mkdir /home/docker/services
    [ -d /home/docker/volumes ] || mkdir /home/docker/volumes
    [ -d /home/docker/backups ] || mkdir /home/docker/backups

    # give current user rwx on the volumes and backups
    # shellcheck disable=SC2086
    [ "$(getfacl /home/docker/volumes | grep -c "default:user:$USER")" -eq 0 ] && exec_root "setfacl -Rdm u:$USER:rwx /home/docker/volumes"
    # shellcheck disable=SC2086
    [ "$(getfacl /home/docker/backups | grep -c "default:user:$USER")" -eq 0 ] && exec_root "setfacl -Rdm u:$USER:rwx /home/docker/backups"

    print_line
    return 0
}

# @description create docker user and current user in the group and create dir
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_user() {
    echo "Create Docker User"
    print_line

    exec_root "useradd -m -d /home/docker docker"
    exec_root "passwd docker"
    exec_root "usermod -aG docker docker"
    add_sudo "docker"

    do_as_docker_user "docker_setfacl"

    print_line
    return 0
}

# @description do as the docker user
#
# @args $1 command
# @exitcode 0 If successfull.
# @exitcode 1 On failure
do_as_docker_user() {
    sudo -u docker $1
    return 0
}

# @description create tar for running docker for a local backup
#
# @args $1 docker id
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_id_backup() {
    echo "Create Docker Container Backup $1"
    print_line

    # shellcheck disable=SC2086,SC2143
    if [ ! "$(docker ps -a | grep $1)" ]; then
        container_name="$(docker ps | grep $1 | awk '{ print $2 }')"
        date_id="$(date +'%m/%d/%Y_%s')"
        container_backup="${container_name}_${date_id}_backup"
        docker commit -p "$1" "$container_backup"
        docker save -o /home/docker/backups/"$container_backup".tar "$container_backup"
    fi

    print_line
    return 0
}

# @description create tar for running docker for a local backup
#
# @args $1 docker container name
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_name_backup() {
    echo "Create Docker Container Backup $1"
    print_line

    # shellcheck disable=SC2086,SC2143
    if [ ! "$(docker ps -a | grep $1)" ]; then
        # shellcheck disable=SC2086
        container_name="$(docker ps | grep $1 | awk '{ print $1 }')"
        date_id=$(date +'%m/%d/%Y_%s')
        container_backup="${container_name}_${date_id}_backup"
        docker commit -p "$1" "$container_backup"
        docker save -o /home/docker/backups/"$container_backup".tar "$container_backup"
    fi

    print_line
    return 0
}

# @description check if the port is used
#
# @args $# the backup of all the container names
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_docker_backup_all() {
    while [[ -n $1 ]]; do
        create_docker_name_backup "$1"
        shift # shift all parameters;
    done
    return 0
}
