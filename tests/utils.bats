#!/usr/bin/env bats

source etc/config.conf
source src/utils.sh

CONFIG=init-config

@test "check-args-noargs" {
  if check-args; then 1; else echo 0; fi
}

@test "check-args-args" {
if check-args; then 0; else echo 1; fi
}

@test "check-root-noroot" {
    run check-root apt-get update
    [ "$status" -eq 0 ]
}

@test "check-root-root" {
  skip "make better config parser"
  run echo ${CONFIG[password]} | sudo -S
  [ "$status" -eq 0 ]
  check-root apt-get update
}

@test "check-root-func-noroot" {
  run check-root-func test-func
  [ "$status" -eq 0 ]
}

@test "check-root-func-root" {
  skip "make better config parser"
  run echo ${CONFIG[password]} | sudo -S
  [ "$status" -eq 0 ]
  check-root-func test-func
}

function test-func(){
    apt-get update
}