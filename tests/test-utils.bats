#!/usr/bin/env bats

source ../src/utils.sh

@test "check-args-noargs" {
  result="$(check-args)"
  [ "$result" -eq 1 ]
}

@test "check-args-args" {
  result="$(check-args 1)"
  [ "$result" -eq 0 ]
}

@test "check-root-noroot" {
  result="$(apt-get update)"
  [ "$result" -eq 1 ]
}

@test "check-root-root" {
  su root
  result="$(apt-get update)"
  [ "$result" -eq 1 ]
}

@test "check-root-func-noroot" {
  result="$(test-func)"
  [ "$result" -eq 0 ]
}

@test "check-root-func-root" {
  su root
  result="$(test-func)"
  [ "$result" -eq 0 ]
}

function test-func(){
    apt-get update
}