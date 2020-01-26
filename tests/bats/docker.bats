#!/usr/bin/env bats

source "$(dirname "${BASH_SOURCE[0]}")"/../../src/docker/docker.sh

@test "install_docker" {
    install_docker
    [ "$status" -eq 0 ]
}

@test "install_docker_compose" {
    install_docker_compose
    [ "$status" -eq 0 ]

}

@test "install_docker_extra" {
    install_docker_extra
    [ "$status" -eq 0 ]
}

@test "prune_images_volumes_all" {
    prune_images_volumes_all
    [ "$status" -eq 0 ]
}

@test "stop_containers_all" {
    stop_containers_all
    [ "$status" -eq 0 ]
}

@test "remove_containers_all"{
    remove_containers_all
    [ "$status" -eq 0 ]
}