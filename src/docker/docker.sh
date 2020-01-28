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
    aptremove docker
    aptremove docker-engine
    aptremove docker.io
    aptremove containerd
    aptremove runc
    aptinstall apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | exec_root apt-key add -
    exec_root apt-key fingerprint 0EBFCD88
    if [[ "$(lsb_release -cs)" == "eoan" ]]; then
        if [[ "$UID" -gt 0 ]]; then
            sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu disco stable"
        else
            add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu disco stable"
        fi
    else
        if [[ "$UID" -gt 0 ]]; then
            sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        else
            add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
        fi
    fi

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
install_docker_compose() {
    echo "Install Docker Compose"
    print_line

    exec_root curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    exec_root chmod +x /usr/local/bin/docker-compose
    #ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

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

    curl -sSf https://moncho.github.io/dry/dryup.sh | exec_root sh

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

    docker rm "$(docker ps -a -q)"

    print_line
    return 0
}

# @description this  creates the volumes, services and backup directories. It then assisgns the current user to the ACL to give full read write access
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
docker_create_dir() {
    echo "Create Folder for Docker User"
    print_line

    [ -d /home/udocker/services ] || exec_root mkdir -p /home/udocker/services
    [ -d /home/udocker/volumes ] || exec_root mkdir -p /home/udocker/volumes
    [ -d /home/udocker/backups ] || exec_root mkdir -p /home/udocker/backups

    # give current user rwx on the volumes and backups
    exec_root chmod 755 /home/udocker/services
    exec_root chmod 755 /home/udocker/volumes
    exec_root chmod 755 /home/udocker/backups

    exec_root chown udocker:udocker /home/udocker/services
    exec_root chown udocker:udocker /home/udocker/volumes
    exec_root chown udocker:udocker /home/udocker/backups

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

    exec_root useradd -m udocker
    exec_root passwd udocker
    exec_root usermod -aG docker udocker
    add_sudo "udocker"

    docker_create_dir

    print_line
    return 0
}

# @description do as the docker user
#
# @args $1 command
# @exitcode 0 If successfull.
# @exitcode 1 On failure
do_as_udocker_user() {
    if typeset -f "$1" > /dev/null; then
        FUNC=$(declare -f $1) 
        echo "sudo -u udocker bash -c '$FUNC; $1'"
        sudo -u udocker bash -c "$FUNC; $1"
    else
        local command="$*"
        echo "sudo -u udocker $command"
        sudo -u udocker $command
    fi
    return 0
}

# @description do as the docker user
#
# @args $1 directory path
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_dir_udocker() {
    exec_root mkdir -p "$1"
    exec_root chmod 755 "$1"
    exec_root chown udocker:udocker "$1"
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
        docker save -o /home/udocker/backups/"$container_backup".tar "$container_backup"
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
        docker save -o /home/udocker/backups/"$container_backup".tar "$container_backup"
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
