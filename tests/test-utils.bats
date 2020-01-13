#!/usr/bin/env bats

source ../etc/config.conf
source ../src/utils.sh

CONFIG=init-config

@test "check-args-noargs" {
  if check-args; then 1; else echo 0; fi
}

@test "check-args-args" {
if check-args; then 0; else echo 1; fi
}

@test "check-root-noroot" {
    check-root apt-get update
}

@test "check-root-root" {
  echo ${CONFIG[password]} | sudo -S
  check-root apt-get update
}

@test "check-root-func-noroot" {
  check-root-func test-func
}

@test "check-root-func-root" {
  echo ${CONFIG[password]} | sudo -S
  check-root-func test-func
}

function test-func(){
    apt-get update
}