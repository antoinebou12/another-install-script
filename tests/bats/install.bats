#!/usr/bin/env bats


setup() {
  source "$BATS_TEST_DIRNAME/../../src/install.sh"
}

@test "install_basic" {
    # skip "check later"
    install_basic
    [ "$status" -eq 0 ]
}

@test "install_cockpit" {
    # skip "check later"
    install_cockpit
    [ "$status" -eq 0 ]
}

@test "install_emojify" {
    # skip "check later"
    install_basic
    [ "$status" -eq 0 ]
}

@test "install_signal_cli" {
    # skip "check later"
    install_signal_cli
    [ "$status" -eq 0 ]
}