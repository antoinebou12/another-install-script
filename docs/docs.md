# ansible.sh

to use ansible with vagrant for testing installation or make install with ansible playbook

* [install_ansible()](#installansible)


## install_ansible()

install ansible

_Function has no arguments._

# qemu.sh

to use qemu with ansible and vagrant for testing installation

* [install_qemu()](#installqemu)
* [create_qemu_img()](#createqemuimg)
* [install_qemu_32vm()](#installqemu32vm)
* [run_qemu_32vm()](#runqemu32vm)


## install_qemu()

install the quemu 

_Function has no arguments._

## create_qemu_img()

qemu create a image for qemu

### Arguments

* # @args $1 img of the os
* # @args $2 the num of gb for img

## install_qemu_32vm()

install the os on the image first time qemu

### Arguments

* # @args $1 img of the os
* # @args $2 the iso of the os
* # @args $3 boot cd
* # @args $4 mem for the os

## run_qemu_32vm()

run 32 bits vm with qemu

### Arguments

* # @args $1 img of the os
* # @args $1 img of the os

# vagrant.sh

install vagrant and more



# install.sh

file containing the utils  for the project and other



# container.sh

list of container and other info



# docker.sh

to install docker docker compose on ubuntu18.04

* [install_docker()](#installdocker)
* [install-docker_compose()](#install-dockercompose)
* [install_docker_extra()](#installdockerextra)
* [prune_images_volumes()](#pruneimagesvolumes)
* [stop_all()](#stopall)
* [docker_setfacl()](#dockersetfacl)
* [create_docker_user()](#createdockeruser)
* [login_docker_user()](#logindockeruser)
* [create_docker_id_backup()](#createdockeridbackup)
* [create_docker_name_backup()](#createdockernamebackup)
* [create_docker_backup_all()](#createdockerbackupall)


## install_docker()

install the docker

_Function has no arguments._

## install-docker_compose()

install the docker compose

_Function has no arguments._

## install_docker_extra()

install the docker extra utils dry

_Function has no arguments._

## prune_images_volumes()

prune all the volumes and images

_Function has no arguments._

## stop_all()

stop all container

_Function has no arguments._

## docker_setfacl()

this  creates the volumes, services and backup directories. It then assisgns the current user to the ACL to give full read write access

_Function has no arguments._

## create_docker_user()

create docker user and current user in the group and create dir

_Function has no arguments._

## login_docker_user()

login as the docker user

_Function has no arguments._

## create_docker_id_backup()

create tar for running docker for a local backup

### Arguments

* # @args $1 docker id

### Exit codes

* **0**: If successfull.
* **1**: On failure

## create_docker_name_backup()

create tar for running docker for a local backup

### Arguments

* # @args $1 docker container name

### Exit codes

* **0**: If successfull.
* **1**: On failure

## create_docker_backup_all()

check if the port is used

### Arguments

* # @args $# the backup of all the container names

### Exit codes

* **0**: If successfull.
* **1**: On failure




# cloud-torrent.sh

to install docker cloud-torrent

* [create_docker_cloud-torrent()](#createdockercloud-torrent)


## create_docker_cloud-torrent()

create docker heimdall
https://github.com/jpillora/cloud-torrent

### Arguments

* # @args $1 PORT_WEB 6889
* # @args $2 USERNAME admin
* # @args $3 PASSWORD password
* # @args $4 PATH_DOWNLOAD

### Exit codes

* **0**: If successfull.
* **1**: On failure




# firefly-iii.sh

to install docker firefly-iii

* [create_docker_firefly-iii()](#createdockerfirefly-iii)


## create_docker_firefly-iii()

create docker firefly-iii
https://github.com/firefly-iii/docker

### Arguments

* # @args $1 PORT_WEB
* # @args $2 PATH_DB
* # @args $3 PATH_EXPORT
* # @args $4 PATH_UPLOAD
* # @args $4 POSTGRES_PASSWORD

### Exit codes

* **0**: If successfull.
* **1**: On failure










# heimdall.sh

to install docker heimdall

* [create_docker_heimdall()](#createdockerheimdall)


## create_docker_heimdall()

create docker heimdall
https://hub.docker.com/r/linuxserver/heimdall/

### Arguments

* # @args $1 PATH_CONFIG
* # @args $2 PORT_WEB
* # @args $3 PORT_WEB_HTTPS

### Exit codes

* **0**: If successfull.
* **1**: On failure




# huginn.sh

to install docker huginn

* [create_docker_huginn()](#createdockerhuginn)


## create_docker_huginn()

create docker huginn


### Exit codes

* **0**: If successfull.
* **1**: On failure




# jellyfin.sh

to install docker jellyfin

* [create_docker_jellyfin()](#createdockerjellyfin)


## create_docker_jellyfin()

create docker jellyfin
https://github.com/linuxserver/docker-jellyfin

### Arguments

* # @args $1 PATH_TO_LIBRARY and config
* # @args $2 PATH_TO_TV SHOW
* # @args $3 PATH_TO_MOVIE 
* # @args $4 PORT_WEB 8096
* # @args $5 PORT_OTHER 8920

### Exit codes

* **0**: If successfull.
* **1**: On failure

# jenkins.sh

to install docker jenkins

* [create_docker_jenkins()](#createdockerjenkins)


## create_docker_jenkins()

create docker jenkins
https://github.com/jenkinsci/docker

### Arguments

* # @args $1 port number for the web server
* # @args $1 port number for jenkins server
* # @args $1 the path to jenkins data volume

### Exit codes

* **0**: If successfull.
* **1**: On failure

# jupyterhub.sh

to install docker jupyterhub

* [create_docker_jupyter_hub()](#createdockerjupyterhub)


## create_docker_jupyter_hub()

create docker jupyterhub
https://github.com/jupyterhub/jupyterhub-deploy-docker

### Arguments

* # @args $1 port number for the web server

### Exit codes

* **0**: If successfull.
* **1**: On failure













# mailcow.sh

to install dockermailcow

* [create_docker_mailcow()](#createdockermailcow)


## create_docker_mailcow()

create docker mailcow
https://github.com/mailcow/mailcow-dockerized
https://mailcow.github.io/mailcow-dockerized-docs/i_u_m_install/

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

# mcmyadmin.sh

to install docker mcmyadmin

* [create_docker_mcmyadmin()](#createdockermcmyadmin)


## create_docker_mcmyadmin()

create docker mcmyadmin
https://github.com/linuxserver-archive/docker-mcmyadmin2

### Arguments

* # @args $1 the name of the container
* # @args $2 the path to the minecraft data
* # @args $3 port for the web server
* # @args $4 port for the minecraft server

### Exit codes

* **0**: If successfull.
* **1**: On failure

# medusa.sh

to install docker medusa

* [create_docker_medusa()](#createdockermedusa)


## create_docker_medusa()

create docker medusa
https://github.com/linuxserver/docker-medusa

### Arguments

* # @args $1 PATH_CONFIG
* # @args $2 PATH_DOWNLOAD
* # @args $3 PORT_WEB

### Exit codes

* **0**: If successfull.
* **1**: On failure



















# firefly-iii.sh

to install docker firefly-iii

* [create_docker_firefly-iii()](#createdockerfirefly-iii)


## create_docker_firefly-iii()

create docker firefly-iii
https://github.com/firefly-iii/docker

### Arguments

* # @args $1 PORT_WEB
* # @args $2 PATH_DB
* # @args $3 PATH_EXPORT
* # @args $4 PATH_UPLOAD
* # @args $4 POSTGRES_PASSWORD

### Exit codes

* **0**: If successfull.
* **1**: On failure

# openvpn.sh

to install docker openvpn

* [create_docker_openvpn()](#createdockeropenvpn)


## create_docker_openvpn()

create docekr openvpn
https://github.com/kylemanna/docker-openvpn

### Arguments

* # @args $1 the vps or server domain or ip
* # @args $2 clientname that use the openvpn

### Exit codes

* **0**: If successfull.
* **1**: On failure







# pyload.sh

to install docker pyload

* [create_docker_pyload()](#createdockerpyload)


## create_docker_pyload()

create docker syncthing
https://github.com/linuxserver/docker-pyload/issues/3

### Arguments

* # @args $1 PATH_CONFIG
* # @args $2 PATH_DOWNLOAD
* # @args $3 PORT_WEB

### Exit codes

* **0**: If successfull.
* **1**: On failure







# recalbox.sh

to install docker recalbox

* [create_docker_recalbox()](#createdockerrecalbox)


## create_docker_recalbox()

create docker recalbox
https://github.com/recalbox/recalbox-docker-build

### Arguments

* # @args $1 PATH_RECALBOX

### Exit codes

* **0**: If successfull.
* **1**: On failure










# statping.sh

to install docker statping

* [create_docker_statping()](#createdockerstatping)


## create_docker_statping()

create docker statping
https://github.com/hunterlong/statping/wiki/Docker

### Arguments

* # @args $1 PORT_WEB
* # @args $2 PATH_STATPING

### Exit codes

* **0**: If successfull.
* **1**: On failure

# syncthing.sh

to install docker syncthing

* [create_docker_syncthing()](#createdockersyncthing)


## create_docker_syncthing()

create docker syncthing
https://github.com/syncthing/syncthing

### Arguments

* # @args $1 PORT_WEB
* # @args $2 PORT_SYNC
* # @args $3 PATH_SYNC

### Exit codes

* **0**: If successfull.
* **1**: On failure







# teamspeak.sh

to install docker teamspeak

* [create_docker_teamspeak()](#createdockerteamspeak)


## create_docker_teamspeak()

create docker teamspeak
https://github.com/recalbox/recalbox-docker-build

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure







# install.sh

install my favirote packages for ubuntu18.04 and tested

* [generate_apt_list_ubuntu()](#generateaptlistubuntu)
* [install_basic()](#installbasic)
* [install_cockpit()](#installcockpit)
* [install_emojify()](#installemojify)
* [install_signal_cli()](#installsignalcli)
* [install_signal_ssh_text()](#installsignalsshtext)


## generate_apt_list_ubuntu()

change the source.list with template in /etc

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## install_basic()

install the basic package to ubuntu I personnally like

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## install_cockpit()

install the cockpit to web
See your server in a web browser and perform system tasks with a mouse. It’s easy to start containers, administer storage, configure networks, and inspect logs.
https://cockpit-project.org/

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## install_emojify()

install the cockpit to web

https://github.com/mrowa44/emojify

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## install_signal_cli()

install the cockpit to web
https://github.com/AsamK/signal-cli

### Arguments

* # @args $1 username

### Exit codes

* **0**: If successfull.
* **1**: On failure

## install_signal_ssh_text()

install the cockpit to web
https://8192.one/post/ssh_login_notification_signal/

### Arguments

* # @args $1 phone number senders phone
* # @args $2 phone number recipient

### Exit codes

* **0**: If successfull.
* **1**: On failure

# menu.sh

setup menu and logic

* [password_dialog()](#passworddialog)
* [install_simple_setup_menu()](#installsimplesetupmenu)
* [install_custom_setup_menu()](#installcustomsetupmenu)
* [install_no_docker_setup_menu()](#installnodockersetupmenu)
* [help_setup_menu()](#helpsetupmenu)
* [main_setup_menu()](#mainsetupmenu)


## password_dialog()

whiptails password dialog

### Exit codes

* **0**: If successfull.
* **1**: On failure

## install_simple_setup_menu()

whiptail install simple setup menu

### Exit codes

* **0**: If successfull.
* **1**: On failure

## install_custom_setup_menu()

whiptails install custom setup menu

### Exit codes

* **0**: If successfull.
* **1**: On failure

## install_no_docker_setup_menu()

whiptails install no docker setup menu

### Exit codes

* **0**: If successfull.
* **1**: On failure

## help_setup_menu()

show help for the setup script

### Exit codes

* **0**: If successfull.
* **1**: On failure

## main_setup_menu()

whiptail create setup main menu

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

# utils.sh

file containing the utils  for the project and other

* [show_project_name()](#showprojectname)
* [checkWSL()](#checkwsl)
* [check_packages_install()](#checkpackagesinstall)
* [aptupdate()](#aptupdate)
* [aptupgrade()](#aptupgrade)
* [aptclean()](#aptclean)
* [check_args()](#checkargs)
* [check_root()](#checkroot)
* [check_root_func()](#checkrootfunc)
* [get_mimetype()](#getmimetype)
* [send_email()](#sendemail)
* [config_read_file()](#configreadfile)
* [config_get()](#configget)
* [get_timezones()](#gettimezones)
* [check_command_exist()](#checkcommandexist)
* [check_port()](#checkport)
* [add_sudo()](#addsudo)
* [download_scp()](#downloadscp)
* [upload_scp()](#uploadscp)
* [chmod_sh_all()](#chmodshall)
* [loop_files_func()](#loopfilesfunc)
* [check_debian()](#checkdebian)
* [get_current_ip()](#getcurrentip)
* [get_geolocation()](#getgeolocation)


## show_project_name()

check if the os is debian or ubuntu

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## checkWSL()

check if the system is a WSL

### Exit codes

* **0**: If successfull.
* **1**: On failure

## check_packages_install()

check if the packages exist

### Arguments

* # @args $1 package name

### Exit codes

* **0**: If installed
* **1**: if not installed

## aptupdate()

apt-get update

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## aptupgrade()

apt-get upgrade all

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## aptclean()

apt-get autoclean

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## check_args()

check for args for a

### Arguments

* # @args $@ args

### Exit codes

* **0**: If successfull.
* **1**: On failure

## check_root()

check if the user is root then execute the command

### Arguments

* **$1** (a): bash command

### Exit codes

* **0**: If successfull.
* **1**: On failure

## check_root_func()

check if the user is root then execute the bash func

### Arguments

* **$1** (a): bash func

### Exit codes

* **0**: If successfull.
* **1**: On failure

## get_mimetype()

check mimetype of a file

### Arguments

* **$1** (file):

### Exit codes

* **0**: If successfull.
* **1**: On failure

## send_email()

send mail locally with heirloom-mailx

### Arguments

* **$1** (email): from
* **$2** (email): to
* **$3** (email): subject
* **$4** (email): body
* **$5** (email): attachement file

### Exit codes

* **0**: If successfull.
* **1**: On failure

## config_read_file()

read config file
https://unix.stackexchange.com/questions/175648/use-config-file-for-my-shell-script

### Arguments

* **$1** (the): config fiel path

### Exit codes

* **0**: If successfull.
* **1**: On failure

## config_get()

get config var from a spefic file
https://unix.stackexchange.com/questions/175648/use-config-file-for-my-shell-script

### Arguments

* **$1** (the): config file path
* **$2** (the): config file var

### Exit codes

* **0**: If successfull.
* **1**: On failure

## get_timezones()

get timezone

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## check_command_exist()

check if the port is used

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## check_port()

check if the port is used

### Arguments

* # @args $1 port number

### Exit codes

* **0**: If successfull.
* **1**: On failure

## add_sudo()

check if the port is used

### Arguments

* # @args $# username of the user you want to add

### Exit codes

* **0**: If successfull.
* **1**: On failure

## download_scp()

simple scp for downloading file for a remote dir scp/ssh

### Arguments

* # @args $1 username@ip
* # @args $2 file path on remote device
* # @args $3 file path for the local device

### Exit codes

* **0**: If successfull.
* **1**: On failure

## upload_scp()

simple scp for downloading file for a remote dir scp/ssh

### Arguments

* # @args $1 file path for the local device
* # @args $2 username@ip
* # @args $3 file path on remote device

### Exit codes

* **0**: If successfull.
* **1**: On failure

## chmod_sh_all()

simple scp for downloading file for a remote dir scp/ssh

### Arguments

* # @args $1 path to folder

### Exit codes

* **0**: If successfull.
* **1**: On failure

## loop_files_func()

loop find files func

### Arguments

* # @args $1 path to folder
* # @args $2 regex of files
* # @args $3 func

### Exit codes

* **0**: If successfull.
* **1**: On failure

## check_debian()

check if the os is debian or ubuntu

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## get_current_ip()

check the ip of the server

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## get_geolocation()

check the geolocation based on ip of the server
https://www.howtogeek.com/405088/how-to-get-your-systems-geographic-location-from-a-bash-script/

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

# coverage.sh

file generate the code coverage for bats/bash

* [use_kcov()](#usekcov)
* [install_kcov()](#installkcov)
* [bash_codecov()](#bashcodecov)


## use_kcov()

generate coverage

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## install_kcov()

download the bin of kcov

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## bash_codecov()

send to codecov coverage

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

# linter.sh

shellcheck for all the bash script

* [use_shellcheck()](#useshellcheck)
* [install_shellcheck()](#installshellcheck)


## use_shellcheck()

use shellcheck on all bash script in project

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## install_shellcheck()

install shellcheck
https://github.com/koalaman/shellcheck

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

# test.sh

run bats test



# uninstall.sh

uninstall the project

* [uninstall()](#uninstall)


## uninstall()

uninstall

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

