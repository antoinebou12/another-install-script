#!/usr/bin/env bats

setup() {
  source "$BATS_TEST_DIRNAME/../../src/config.sh"
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

@test "parse_yml_array_ports" {
    if [[ "$(parse_yml_array_ports "airsonic")" == "4040
1900" ]]; then return 0; else return 1; fi
    [ "$status" -eq 0 ]
}

@test "parse_yml_array_web" {
    if [[ "$(parse_yml_array_web "calibre")" == "\":8001\"
\":8002\"" ]]; then return 0; else return 1; fi
    [ "$status" -eq 0 ]
}

@test "containers_url" {
    if [[ "$(containers_url airsonic)" == "localhost:4040" ]]; then return 0; else return 1; fi
    [ "$status" -eq 0 ]
}