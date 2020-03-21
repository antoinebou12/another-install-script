#!/usr/bin/env bats


setup() {
  source "$BATS_TEST_DIRNAME/../../src/firewall.sh"
}

@test "install_firewall" {
    install_firewall
    if check_packages_install ufw; then return 0; else return 1; fi
    [ "$status" -eq 0 ]
}

@test "uninstall_firewall" {
    install_firewall
    uninstall_firewall
    if check_packages_install ufw; then return 1; else return 0; fi
    [ "$status" -eq 0 ]
}

@test "enable_firewall" {
    install_firewall
    enable_firewall
}

@test "disable_firewall" {
    install_firewall
    disable_firewall
}

@test "allow_port_in_firewall" {
    allow_port_in_firewall 80
    deny_port_in_firewall 80
}

@test "deny_port_in_firewall" {
    deny_port_in_firewall 80
}

@test "manage_firewall_ports_allow_list" {
    skip "later"
}

@test "manage_firewall_ports_deny_list" {
    skip "later"
}