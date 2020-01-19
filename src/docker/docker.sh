#!/usr/bin/env bash
#
# @file docker.sh
# @brief to install docker docker compose on ubuntu18.04

# import 
source ../utils.sh

# @description install the docker
#
# @noargs
function install_docker(){
    echo "Install Docker"
    apt-get remove -y docker docker-engine docker.io containerd runc
    apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    apt-key fingerprint 0EBFCD88
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    aptupdate
    sudo apt-get install docker-ce docker-ce-cli containerd.io
    return 0 
}

# @description install the docker compose
#
# @noargs
function install-docker_compose(){
    echo "Install Docker"
    curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    return 0 
}


# @description install the docker extra utils dry
#
# @noargs
function install_docker_extra(){
    curl -sSf https://moncho.github.io/dry/dryup.sh | sh
    return 0 
}

# @description prune all the volumes and images
#
# @noargs
function prune_images_volumes(){
    docker image prune -a
    docker system prune --volumes
}

# @description stop all container
#
# @noargs
function stop_all(){
    docker container stop $(docker container ls -aq)
}

# @description this function creates the volumes, services and backup directories. It then assisgns the current user to the ACL to give full read write access
# 
# @noargs
function docker_setfacl() {
	[ -d /home/docker/services ] || mkdir /home/docker/services
	[ -d /home/docker/volumes ] || mkdir /home/docker/volumes
	[ -d /home/docker/backups ] || mkdir /home/docker/backups

	# give current user rwx on the volumes and backups
	[ $(getfacl /home/docker/volumes | grep -c "default:user:$USER") -eq 0 ] && sudo setfacl -Rdm u:$USER:rwx /home/docker/volumes
	[ $(getfacl /home/docker/backups | grep -c "default:user:$USER") -eq 0 ] && sudo setfacl -Rdm u:$USER:rwx /home/docker/backups
}

# @description create docker user and current user in the group and create dir
#
# @noargs
function create_docker_user(){
    useradd docker
    passwd docker
    usermod -aG docker docker
    
    login_docker_user
    docker_setfacl
    return 0 
}

# @description login as the docker user
#
# @noargs
function login_docker_user(){
    su - docker
}

# @description create tar for running docker for a local backup
#
# @args $1 docker id
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function create_docker_id_backup(){
    if [ ! "$(docker ps -a | grep $1)" ]; then
        container_name=docker ps | grep $1 | awk '{ print $2 }'
        date_id=$(date +'%m/%d/%Y_%s')
        container_backup="${container_name}_${date_id}_backup"
        docker commit -p  $1 $container_backup
        docker save -o /home/docker/backups/$container_backup.tar $container_backup
    fi
    return 0
}

# @description create tar for running docker for a local backup
#
# @args $1 docker container name
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function create_docker_name_backup(){
    if [ ! "$(docker ps -a | grep $1)" ]; then
        container_name=docker ps | grep $1 | awk '{ print $1 }'
        date_id=$(date +'%m/%d/%Y_%s')
        container_backup="${container_name}_${date_id}_backup"
        docker commit -p  $1 $container_backup
        docker save -o /home/docker/backups/$container_backup.tar $container_backup
    fi
    return 0
}

# @description check if the port is used
#
# @args $# the backup of all the container names
# @exitcode 0 If successfull.
# @exitcode 1 On failure
function create_docker_backup_all(){
    while [[ -n $1 ]]; do
        create_docker_name_backup $1
        shift # shift all parameters;
    done
    return 0
}