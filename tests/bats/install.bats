#!/usr/bin/env bats


setup() {
  source "$BATS_TEST_DIRNAME/../../src/install.sh"
}

@test "install_basic" {
    install_basic
    if check_packages_install jq; then return 0; else return 1; fi
    [ "$status" -eq 0 ]
    aptremove jq
    if check_packages_install jq; then return 0; else return 1; fi
    [ "$status" -eq 1 ]
}

@test "install_cockpit" {
    install_cockpit
    if check_packages_install cockpit; then return 0; else return 1; fi
    [ "$status" -eq 0 ]
    aptremove cockpit cockpit-docker cockpit-machines cockpit-packagekit
    deny_port_in_firewall 9090
    if check_packages_install cockpit; then return 0; else return 1; fi
    [ "$status" -eq 1 ]
}

@test "install_ansible" {
    install_ansible
    if check_packages_install ansible; then return 0; else return 1; fi
    [ "$status" -eq 0 ]
    aptremove ansible
    exec_root apt-key del 93C4A3FD7BB9C367
    exec_root pip3 uninstall ansible
    if check_packages_install ansible; then return 0; else return 1; fi
    [ "$status" -eq 1 ]
}

@test "install_emojify" {
    install_emojify
    if [[  -f /usr/local/bin/emojify ]]; then return 0; else return 1; fi
    [ "$status" -eq 0 ]
    exec_root rm -rf /usr/local/bin/emojify
    if [[  -f /usr/local/bin/emojify ]]; then return 0; else return 1; fi
    [ "$status" -eq 1 ]
}

@test "manage_exec_install_list" {
    manage_exec_install_list "basic" "emojify"
    if check_packages_install jq; then return 0; else return 1; fi
    [ "$status" -eq 0 ]
    if [[  -f /usr/local/bin/emojify ]]; then return 0; else return 1; fi
    [ "$status" -eq 0 ]
    exec_root rm -rf /usr/local/bin/emojify
     if [[  -f /usr/local/bin/emojify ]]; then return 0; else return 1; fi
    [ "$status" -eq 1 ]
}