#!/usr/bin/env bats


setup() {
  source "$BATS_TEST_DIRNAME/../../src/docker/docker.sh"
}

@test "install_docker" {
    # skip "check later"
    install_docker
    [ "$status" -eq 0 ]
}

@test "install_docker_compose" {
    # skip "check later"
    install_docker_compose
    [ "$status" -eq 0 ]

}

@test "install_docker_extra" {
    # skip "check later"
    install_docker_extra
    [ "$status" -eq 0 ]
}

@test "prune_images_volumes_all" {
    skip "check later"
    prune_images_volumes_all
    [ "$status" -eq 0 ]
}

@test "stop_containers_all" {
    skip "check later"
    stop_containers_all
    [ "$status" -eq 0 ]
}

@test "remove_containers_all" {
    skip "check later"
    remove_containers_all
    [ "$status" -eq 0 ]
}