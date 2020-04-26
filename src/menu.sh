#!/usr/bin/env bash
#
# @file menu.sh
# @brief setup menu and logic

# import
# shellcheck source=config.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/config.sh"
# shellcheck source=src/containers.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/containers.sh"
# shellcheck source=src/docker.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/docker.sh"
# shellcheck source=src/firewall.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/firewall.sh"
# shellcheck source=src/install.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/install.sh"
# shellcheck source=src/other.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/other.sh"
# shellcheck source=src/router.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/router.sh"
# shellcheck source=src/utils.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/utils.sh"

#const
WHIPTAIL_TEXT=$(($(tput lines) - 8))
WHIPTAIL_HEIGHT=$(($(tput cols) - 24))
WHIPTAIL_WIDTH=$(($(tput lines) - 16))

# @description whiptails password dialog
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
password_dialog() {
    while [[ "$passphrase" != "$passphrase_repeat" || ${#passphrase} -lt 8 ]]; do
        local passphrase_invalid_message=""
        local passphrase=$(whiptail --passwordbox "${passphrase_invalid_message}Please enter the passphrase (8 chars min.):" 20 78 3>&1 1>&2 2>&3)
        local passphrase_invalid_message=$?
        if [[ $? == 0 ]] && [[ ! -z "$passphrase" ]]; then
            local passphrase_repeat=$(whiptail --passwordbox "Please repeat the passphrase:" 20 78 3>&1 1>&2 2>&3)
            if [[ $? == 0 ]] && [[ ! -z "$passphrase_repeat" ]]; then
                local passphrase_invalid_message="Passphrase too short, or not matching! "
            elif [[ $? = 1 ]]; then
                break
            else
                break
            fi
        elif [[ $? = 1 ]]; then
            break
        else
            break
        fi
    done
    echo $passphrase
    return 0
}

# @description whiptails install custom setup menu
#
# @exitcode 0 If successfull.
# @exitcode 1 On failur3
install_setup_menu() {

    declare -a SETUP_INSTALL_ITEMS=(
        "basic" "Basic packages install (required)" "ON"
        "docker" "Install docker and docker-compose (required)" "ON"
        "docker_extra" "Install dry and ctop for docker" "OFF"
        "cockpit" "Install Cockpit web server management" "OFF"
        "lxde" "Install LXDE Desktop Environment" "OFF"
        "ansible" "Install Ansible systems automation" "OFF"
        "dokku" "Install Dokku PaaS to your build applications" "OFF"
        "lynk" "Install Lynk safely expose their TCP services to the internet" "OFF"
        "vagrant" "Install Vagrant for VM utility" "OFF"
        "emojify" "Emoji in the terminal" "OFF"
    )

    if [ $(tput lines) -lt 45 ]; then
        local NUM_ITEMS_SCALE="$((${#SETUP_INSTALL_ITEMS[@]} / 3))"
    elif [ $(tput lines) -gt 50 ]; then
        local NUM_ITEMS_SCALE="$((${#SETUP_INSTALL_ITEMS[@]} / 3))"
    else
        local NUM_ITEMS_SCALE=$((${#SETUP_INSTALL_ITEMS[@]} / 3))
    fi

    local SETUP_INSTALL_MENU=$(whiptail --nocancel --clear --title "Install" --checklist "Navigate with arrow and select with space" --separate-output "${WHIPTAIL_TEXT}" "${WHIPTAIL_HEIGHT}" "${NUM_ITEMS_SCALE}" -- "${SETUP_INSTALL_ITEMS[@]}" 3>&1 1>&2 2>&3)

    if [[ $? == 0 ]] && [[ ! -z "$SETUP_INSTALL_MENU" ]]; then
        show_project_name
        manage_exec_install_list "$SETUP_INSTALL_MENU"
        if [[ "$SETUP_INSTALL_MENU" == *"docker"* ]]; then
            add_container_setup_menu
        fi
    fi

    return 0
}

# @description whiptails install add custom add container setup menu
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
add_container_setup_menu() {
    generate_container_menu

    if [ $(tput lines) -lt 25 ]; then
        local NUM_ITEMS_SCALE="$((${#CONTAINER_NAME_MENU[@]} / 16))"
    elif [ $(tput lines) -lt 35 ]; then
        local NUM_ITEMS_SCALE="$((${#CONTAINER_NAME_MENU[@]} / 12))"
    elif [ $(tput lines) -lt 45 ]; then
        local NUM_ITEMS_SCALE="$((${#CONTAINER_NAME_MENU[@]} / 9))"
    elif [ $(tput lines) -gt 50 ]; then
        local NUM_ITEMS_SCALE="$((${#CONTAINER_NAME_MENU[@]} / 6))"
    else
        local NUM_ITEMS_SCALE="$((${#CONTAINER_NAME_MENU[@]} / 3))"
    fi

    SETUP_CONTAINER_MENU=$(whiptail --nocancel --clear --title "Container List" --checklist "Navigate with arrow and select with space" --separate-output "${WHIPTAIL_TEXT}" "${WHIPTAIL_HEIGHT}" "${NUM_ITEMS_SCALE}" -- "${CONTAINER_NAME_MENU[@]}" 3>&1 1>&2 2>&3)

    if [[ $? == 0 ]] && [[ ! -z "$SETUP_CONTAINER_MENU" ]]; then
        manage_exec_containers_list "$SETUP_CONTAINER_MENU"
        return 0
    else
        echo "Error"
        return 1
    fi
    return 0
}

# @description remove installed containers
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
remove_container_menu() {
    generate_remove_container_menu
    if [ $(tput lines) -lt 25 ]; then
        local NUM_ITEMS_SCALE="$((${#CONTAINER_INSTALLED_NAME_MENU[@]} / 16))"
    elif [ $(tput lines) -lt 35 ]; then
        local NUM_ITEMS_SCALE="$((${#CONTAINER_INSTALLED_NAME_MENU[@]} / 12))"
    elif [ $(tput lines) -lt 45 ]; then
        local NUM_ITEMS_SCALE="$((${#CONTAINER_INSTALLED_NAME_MENU[@]} / 9))"
    elif [ $(tput lines) -gt 50 ]; then
        local NUM_ITEMS_SCALE="$((${#CONTAINER_INSTALLED_NAME_MENU[@]} / 6))"
    else
        local NUM_ITEMS_SCALE="$((${#CONTAINER_INSTALLED_NAME_MENU[@]} / 3))"
    fi

    REMOVE_CONTAINER_LIST_MENU=$(whiptail --nocancel --clear --title "Container List" --checklist "Navigate with arrow and select with space" --separate-output "${WHIPTAIL_TEXT}" "${WHIPTAIL_HEIGHT}" "${NUM_ITEMS_SCALE}" -- "${CONTAINER_INSTALLED_NAME_MENU[@]}" 3>&1 1>&2 2>&3)

    if [[ $? == 0 ]] && [[ ! -z "$REMOVE_CONTAINER_LIST_MENU" ]]; then
        remove_containers_list "$REMOVE_CONTAINER_LIST_MENU"
        return 0
    else
        echo "Error"
        return 1
    fi
    return 0
}



# @description uninstall the user and all
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
backup_setup_menu() {
    bash uninstall.sh
    return 0
}

# @description uninstall the user and all
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
uninstall_setup_menu() {
    bash uninstall.sh
    return 0
}

# @description show help for the setup script
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
help_setup_menu() {
    cat docs/help.txt
    return 0
}

# @description whiptail create setup main menu
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
main_setup_menu() {
    if [[ $(read_config_yml system_bashmenu) == "yes" ]]; then
        SETUP_MENU=$(whiptail --clear --title "Another Install Script" --menu --notags "" 20 78 12 -- \
            "install" "Installation" \
            "addContainer" "Add Container" \
            "removeContainer" "Remove Container" \
            "uninstallAll" "Uninstall" \
            "backup" "Backup" \
            "help" "Help" \
            "exit" "Exit" \
            3>&1 1>&2 2>&3)

        case $SETUP_MENU in
        "install")
            install_setup_menu
            ;;
        "addContainer")
            add_container_setup_menu
            ;;
        "removeContainer")
            remove_container_menu
            ;;
        "uninstallAll")
            uninstall_setup_menu
            ;;
        "backup")
            backup_setup_menu
            ;;
        "help")
            help_setup_menu
            ;;
        "exit")
            exit 0
            ;;
        *) ;;
        esac
    else
        echo "Error"
    fi
}
