#!/usr/bin/env bats

setup() {
  source "$BATS_TEST_DIRNAME/../../src/config.sh"
}

@test "config_read_file" {
  if [[ "$(config_read_file "$BATS_TEST_DIRNAME/config_test.cfg")" == "__UNDEFINED__" ]]; then return 0; else return 1; fi
  if config_read_file "$BATS_TEST_DIRNAME/config_test.cfg"; then return 0; else return 1; fi
  [ "$status" -eq 0 ]
}

@test "config_get" {
  if [[ "$(config_get "$BATS_TEST_DIRNAME/config_test.cfg" "email")" == "test@test.com" ]]; then return 0; else return 1; fi
  [ "$status" -eq 0 ]
}

@test "parse_yml_array_ports" {
  if [[ "$(parse_yml_array_ports "airsonic")" == $'4040\n1900' ]]; then return 0; else return 1; fi
  [ "$status" -eq 0 ]
}

@test "parse_yml_array_web" {
  if [[ "$(parse_yml_array_web "calibre")" == $':8001\n:8002' ]]; then return 0; else return 1; fi
  [ "$status" -eq 0 ]
}

@test "container_url" {
  if [[ "$(container_url airsonic)" == "localhost:4040" ]]; then return 0; else return 1; fi
  [ "$status" -eq 0 ]
}

@test "subdomain_container_url" {
  if [[ "$(subdomain_container_url airsonic)" == "airsonic.localhost" ]]; then return 0; else return 1; fi
  [ "$status" -eq 0 ]
}