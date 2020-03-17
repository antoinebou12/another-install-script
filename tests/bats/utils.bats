#!/usr/bin/env bats


setup() {
  source "$BATS_TEST_DIRNAME/../../src/utils.sh"
}

test-func(){
    apt-get update
}

@test "checkWSL" {
  WSL_DISTRO_NAME="wsltest"
  if checkWSL; then return 0; else return 1; fi
  [ "$status" -eq 0 ]
  unset WSL_DISTRO_NAME
}

@test "check_packages_install" {
  # skip "check later"
  if check_packages_install nano; then return 0; else return 1; fi
  [ "$status" -eq 0 ]
  if check_packages_install afdasv; then return 0; else return 1; fi
  [ "$status" -eq 1 ]
}

@test "aptupdate" {
  # skip
  aptupdate
}

@test "aptinstall and aptremove" {
  # skip
  aptinstall vim
  if check_packages_install vim; then return 0; else return 1; fi
  [ "$status" -eq 0 ]
  aptremove vim
  if check_packages_install vim; then return 0; else return 1; fi
  [ "$status" -eq 1 ]
}

@test "check_args-noargs" {
  if check_args; then echo 1; else return 0; fi
  [ "$status" -eq 0 ]
}

@test "check_args-args" {
  if check_args "1" "2"; then return 0; else return 1; fi
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

@test "get_timezones" {
  # skip "check later"
  if [[ "$(get_timezones)" == "$(cat /etc/timezone)" ]]; then return 0; else return 1; fi
  [ "$status" -eq 0 ]
}

@test "check_command_exist" {
  # skip "check later"
  if check_command_exist ls; then return 0; else return 1; fi
  [ "$status" -eq 0 ]
  if check_command_exist afafafa; then return 0; else return 1; fi
  [ "$status" -eq 1 ]
}

@test "check_port" {
  skip
  check_port 80
  [ "$status" -eq 0 ]
  check_port 1111
  [ "$status" -eq 1 ]
}