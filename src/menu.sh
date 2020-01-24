#!/usr/bin/env bash
#
# @file menu.sh
# @brief setup menu and logic

# import
source src/utils.sh
source src/install.sh
source src/docker/containers.sh
source src/docker/docker.sh

#const
WHIPTAIL_TEXT=20
WHIPTAIL_HEIGHT=$(( $(tput cols) - 24 ))
WHIPTAIL_WIDTH=$(( $(tput lines) - 12 ))


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
install_simple_setup_menu(){
    generate_apt_list_ubuntu
    aptupdate
    aptupgrade
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
# @exitcode 1 On failure
install_custom_setup_menu(){
    declare -a CONTAINER_NAME_MENU=("cloud_torrent" "cloud_torrent" "ON" "heimdall" "heimdall" "ON" "huginn" "huginn" "OFF" "jellyfin" "jellyfin" "ON" "jenkins" "jenkins" "OFF" "jupyterhub" "jupyterhub" "OFF" "mailcow" "mailcow" "ON" "mcmyadmin" "mcmyadmin" "OFF" "medusa" "medusa" "OFF" "openvpn" "openvpn" "ON" "pyload" "pyload" "ON" "recalBox" "recalBox" "OFF" "statping" "statping" "ON" "syncthing" "syncthing" "ON" "teamspeak" "teamspeak" "OFF" )
    SETUP_CONTAINER_MENU=$(whiptail --title "Container List" --checklist "Navigate with arrow and select with space" "${WHIPTAIL_TEXT}" "${WHIPTAIL_HEIGHT}" "$((${#CONTAINER_NAME_MENU[@]}/3))" "${CONTAINER_NAME_MENU[@]}" 3>&1 1>&2 2>&3)
    if [[ $? == 0 ]] && [[ ! -z "$SETUP_CONTAINER_MENU" ]]; then
        echo $SETUP_CONTAINER_MENU
        return
    else
        echo "Error"
        return 1
    fi
    return 0
}

# @description whiptails install no docker setup menu
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_no_docker_setup_menu(){
    aptupdate
    install_basic
    install_cockpit
    install_emojify
    return 0
}

# @description show help for the setup script
#
# @exitcode 0 If successfull.
# @exitcode 1 On failure
help_setup_menu(){
    cat docs/help.txt
    return 0
}


# @description whiptail create setup main menu
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
main_setup_menu(){

    SETUP_MENU=$(whiptail --title "Main Menu" --menu --notags "" 20 78 12 -- \
	"install_simple" "Simple Installation" \
	"install_custom" "Custom Installation" \
	"install_no_docker" "No Docker Installation" \
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
    "install_no_docker")
        install_no_docker_setup_menu
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


main_setup_menu