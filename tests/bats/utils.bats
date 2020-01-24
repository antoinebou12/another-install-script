#!/usr/bin/env bats

source $(dirname "$0")/../../src/utils.sh

 test-func(){
    apt-get update
}

@test "checkWSL" {
  checkWSL
  [ "$status" -eq 1 ]
  WSL_DISTRO_NAME="wsltest"
  [ "$status" -eq 1 ]
  unset WSL_DISTRO_NAME
}

@test "check_packages_install" {
  check_packages_install nano
  [ "$status" -eq 0 ]
    check_packages_install dasdsad
  [ "$status" -eq 1 ]
}

@test "aptupdate" {
  aptupdate
  [ "$status" -eq 0 ]
}

@test "aptupgrade" {
  aptupgrade
  [ "$status" -eq 0 ]
}

@test "aptclean" {
  aptclean
  [ "$status" -eq 0 ]
}

@test "check_args-noargs" {
  if check_args; then echo 1; else return 0; fi
  [ "$status" -eq 0 ]
}

@test "check_args-args" {
  if check_args "1" "2"; then return 0; else echo 1; fi
  [ "$status" -eq 0 ]
}

@test "check-root-noroot" {
  skip "make better func"
  run check-root apt-get update
  [ "$status" -eq 0 ]
}

@test "check-root-root" {
  skip "make better func"
  set -e
  run echo $(get_config config_test.cfg password) | sudo -S
  check-root "apt-get update"
  [ "$status" -eq 0 ]
}

@test "check-root-func-noroot" {
  skip "make better func"
  run check-root-func test-func
  [ "$status" -eq 0 ]
}

@test "check-root-func-root" {
  skip "make better func"
  set -e
  run echo $(get_config config_test.cfg password) | sudo -S
  check-root-func test-func
  [ "$status" -eq 0 ]
}

@test "get_mimetype" {
  if [[ "$(get_mimetype src/install.sh)" = "text/x-shellscript" ]]; then  return 0; else return 1; fi
  [ "$status" -eq 0 ]
}

@test "send_email" {
  skip "check later"
  if send_email "test" "$(config_get config_test.cfg email)" "Test" "Test" "config_test.cfg"; then  return 0; else echo 1; fi
  [ "$status" -eq 0 ]
}

@test "config_read_file" {
  if [[ "$(config_read_file config_test.cfg)" == "__UNDEFINED__" ]]; then echo 0; else return 1; fi
  if config_read_file config_test.cfg; then return 0; else echo 1; fi
  [ "$status" -eq 0 ]
}

@test "config_get" {
  if [[ "$(config_read_file config_test.cfg email)" == "test@test.com" ]]; then return 0; else return 1; fi
  [ "$status" -eq 0 ]
}

@test "get_timezones" {
  if [[ TZ == "$(cat /etc/timezone)" ]]; then return 0; else return 1 fi;
}

@test "check_command_exist" {
  check_command_exist ls
  [ "$status" -eq 0 ]
  check_command_exist afafafa
  [ "$status" -eq 1 ]
}

@test "check_port" {
  check_port 80
  [ "$status" -eq 0 ]
  check_port 1111
  [ "$status" -eq 1 ]
}

@test "check_debian" {
  check_debian
  [ "$status" -eq 0 ]
}