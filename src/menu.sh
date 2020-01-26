#!/usr/bin/env bash
#
# @file menu.sh
# @brief setup menu and logic

# import
source "$(dirname "${BASH_SOURCE[0]}")/utils.sh"
source "$(dirname "${BASH_SOURCE[0]}")/install.sh"
source "$(dirname "${BASH_SOURCE[0]}")/docker/containers.sh"
source "$(dirname "${BASH_SOURCE[0]}")/docker/docker.sh"

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

# @description whiptail install simple setup menu
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_simple_setup_menu() {
    show_project_name
    generate_apt_list_ubuntu
    aptupdate
    aptupgrade
    aptclean
    install_basic
    install_cockpit
    install_emojify
    install_docker
    install_docker_extra
    create_docker_user
    return 0
}

# @description whiptails install custom setup menu
#
# @exitcode 0 If successfull.
# @exitcode 1 On failur3
install_custom_setup_menu() {
    if [ $(tput lines) -lt 45 ]; then
        local NUM_ITEMS_SCALE="$((${#CONTAINER_NAME_MENU[@]} / 9))"
    elif [ $(tput lines) -gt 50 ]; then
        local NUM_ITEMS_SCALE="$((${#CONTAINER_NAME_MENU[@]} / 6))"
    else
        local NUM_ITEMS_SCALE="$((${#CONTAINER_NAME_MENU[@]} / 3))"
    fi
    SETUP_CONTAINER_MENU=$(whiptail --nocancel --clear --title "Container List" --checklist "Navigate with arrow and select with space" --separate-output "${WHIPTAIL_TEXT}" "${WHIPTAIL_HEIGHT}" "${NUM_ITEMS_SCALE}" -- "${CONTAINER_NAME_MENU[@]}" 3>&1 1>&2 2>&3)
    if [[ $? == 0 ]] && [[ ! -z "$SETUP_CONTAINER_MENU" ]]; then
        show_project_name
        install_basic
        install_cockpit
        install_emojify
        install_docker
        create_docker_user
        manage_exec_containers_list "$SETUP_CONTAINER_MENU"
        return 0
    else
        echo "Error"
        return 1
    fi
    return 0
}

# @description whiptails install add custom setup menu
#
# @exitcode 0 If successfull.
# @exitcode 1 On failur3
add_custom_extra_setup_menu() {
    if [ $(tput lines) -lt 45 ]; then
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

    SETUP_MENU=$(whiptail --clear --title "Another Install Script" --menu --notags "" 20 78 12 -- \
        "install_simple" "Simple Installation" \
        "install_custom" "Custom Installation" \
        "add_extra" "Add Extra" \
        "help" "Help" \
        "exit" "Exit" \
        3>&1 1>&2 2>&3)

    case $SETUP_MENU in
    "install_simple")
        install_simple_setup_menu
        ;;
    "install_custom")
        install_custom_setup_menu
        ;;
    "add_extra")
        add_custom_extra_setup_menu
        ;;
    "help")
        cat docs/help.txt
        ;;
    "exit")
        exit 0
        ;;
    *) ;;
    esac
}
