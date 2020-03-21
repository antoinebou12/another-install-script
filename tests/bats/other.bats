#!/usr/bin/env bats


setup() {
  source "$BATS_TEST_DIRNAME/../../src/other.sh"
}

@test "get_mimetype" {
  skip "check later"
  if [[ "$(get_mimetype src/install.sh)" = "text/x-shellscript" ]]; then  return 0; else return 1; fi
  [ "$status" -eq 0 ]
}

@test "send_email" {
  skip "check later"
  if send_email "test" "$(config_get config_test.cfg email)" "Test" "Test" "config_test.cfg"; then  return 0; else echo 1; fi
  [ "$status" -eq 0 ]
}


@test "install_signal_cli" {
    skip "check later"
    install_signal_cli
    [ "$status" -eq 0 ]
}