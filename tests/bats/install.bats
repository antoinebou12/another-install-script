#!/usr/bin/env bats

source "$(dirname "${BASH_SOURCE[0]}")"/../../src/install.sh


@test "install_basic" {
    install_basic
    [ "$status" -eq 0 ]
}

@test "install_cockpit" {
    install_cockpit
    [ "$status" -eq 0 ]
}

@test "install_emojify" {
    install_basic
    [ "$status" -eq 0 ]
}

@test "install_signal_cli" {
    install_signal_cli
    [ "$status" -eq 0 ]
}