#!/usr/bin/env bats

setup() {
  source "$BATS_TEST_DIRNAME/../../src/docker.sh"
  create_docker_user
}

teardown () {
    remove_docker_user
}

@test "install_docker" {
    skip "check later"
    install_docker
}

@test "install_docker_compose" {
    install_docker_compose
    if [[ -f /usr/local/bin/docker-compose ]]; then return 0; else return 1; fi
    exec_root rm -rf /usr/local/bin/docker-compose
}

@test "install_docker_extra" {
    install_docker_extra
    if [[ -f /usr/local/bin/dry ]]; then return 0; else return 1; fi
    if [[ -f /usr/local/bin/ctop ]]; then return 0; else return 1; fi
    exec_root rm -rf /usr/local/bin/dry
    exec_root rm -rf /usr/local/bin/ctop
}

@test "create_docker_user" {
    create_docker_user
    remove_docker_user
}

@test "docker_create_default_dir" {
    create_docker_user
    udocker_create_default_dir
    remove_docker_user
}

@test "do_as_udocker_user" {
    create_docker_user
    do_as_udocker_user "touch /home/udocker/test.txt"
    if [[ -f /home/udocker/test.txt ]];then return 0; else return 1; fi
    exec_root rm -rf /home/udocker/test.txt
    do_as_udocker_user print_line utils.sh
    remove_docker_user
}

@test "udocker_create_dir" {
    create_docker_user
    udocker_create_dir "/home/udocker/test"
    if [[ "$(ls -al /home/udocker/ | grep "test" | awk '{print $3}')" == "udocker" ]];then return 0; else return 1; fi
    exec_root rm -rf /home/udocker/test
    remove_docker_user
}

@test "prune_containers_volumes_all" {
    skip "check later"
    prune_containers_volumes_all
}
