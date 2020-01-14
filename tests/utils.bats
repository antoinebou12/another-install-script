#!/usr/bin/env bats
source src/utils.sh
@test "check-args-noargs" {
  if check-args; then 1; else echo 0; fi
}

@test "check-args-args" {
  if check-args; then 0; else echo 1; fi
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

function test-func(){
    apt-get update
}