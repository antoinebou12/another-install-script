# test.sh

run bats test



# linter.sh

shellcheck for all the bash script

* [install_shellcheck()](#installshellcheck)
* [use_shellcheck()](#useshellcheck)


## install_shellcheck()

install shellcheck
https://github.com/koalaman/shellcheck

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## use_shellcheck()

use shellcheck on all bash script in project

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

# semver.sh

semver https://semver.org/

* [install_semver()](#installsemver)
* [use_semver()](#usesemver)


## install_semver()

install semver
https://github.com/fsaintjacques/semver-tool

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## use_semver()

use semver ci

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

# uninstall.sh

uninstall the project

* [uninstall()](#uninstall)


## uninstall()

uninstall everything

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

# install.sh

file containing the utils  for the project and other



# menu.sh

setup menu and logic

* [password_dialog()](#passworddialog)
* [install_setup_menu()](#installsetupmenu)
* [add_container_setup_menu()](#addcontainersetupmenu)
* [uninstall_setup_menu()](#uninstallsetupmenu)
* [help_setup_menu()](#helpsetupmenu)
* [main_setup_menu()](#mainsetupmenu)


## password_dialog()

whiptails password dialog

### Exit codes

* **0**: If successfull.
* **1**: On failure

## install_setup_menu()

whiptails install custom setup menu

### Exit codes

* **0**: If successfull.
* **1**: On failur3

## add_container_setup_menu()

whiptails install add custom add container setup menu

### Exit codes

* **0**: If successfull.
* **1**: On failure

## uninstall_setup_menu()

uninstall the user and all

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

* [print_line()](#printline)
* [show_project_name()](#showprojectname)
* [checkWSL()](#checkwsl)
* [check_args()](#checkargs)
* [check_root()](#checkroot)
* [exec_root()](#execroot)
* [exec_root_func()](#execrootfunc)
* [check_packages_install()](#checkpackagesinstall)
* [aptupdate()](#aptupdate)
* [aptupgrade()](#aptupgrade)
* [aptinstall()](#aptinstall)
* [aptremove()](#aptremove)
* [aptclean()](#aptclean)
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
* [show_aliases()](#showaliases)
* [parse_yml()](#parseyml)
* [read_config_yml()](#readconfigyml)
* [dist_check()](#distcheck)
* [virt_check()](#virtcheck)


## print_line()

print line ======

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## show_project_name()

print ascii art

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## checkWSL()

check if the system is a WSL

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

check root user

### Arguments

* **$1** (a): bash command

### Exit codes

* **0**: If successfull.
* **1**: On failure

## exec_root()

check if the user is root then execute the command

### Arguments

* **$1** (a): bash command

### Exit codes

* **0**: If successfull.
* **1**: On failure

## exec_root_func()

check if the user is root then execute the bash func

### Arguments

* **$1** (a): bash func

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

upgrade all

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## aptinstall()

install package

### Arguments

* # @args $@ packages to install

### Exit codes

* **0**: If successfull.
* **1**: On failure

## aptremove()

remove package

### Arguments

* # @args $@ packages to remove

### Exit codes

* **0**: If successfull.
* **1**: On failure

## aptclean()

apt-get autoclean

_Function has no arguments._

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

## show_aliases()

show aliases in the current shell
https://riptutorial.com/bash/topic/368/aliasing

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## parse_yml()

Read YML file from Bash script
https://gist.github.com/pkuczynski/8665367

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## read_config_yml()

get value for yml

### Arguments

* # @args $1 variable path name

### Exit codes

* **0**: If successfull.
* **1**: On failure

## dist_check()

show aliases in the current shell
Detect Operating System

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## virt_check()

show aliases in the current shell
Checking For Virtualization

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

# code-server.sh

to install docker code-server

* [create_docker_code-server()](#createdockercode-server)
* [remove_docker_bookstack()](#removedockerbookstack)


## create_docker_code-server()

create docker code-server
link

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_bookstack()

remove docker bookstack

### Exit codes

* **0**: If successfull.
* **1**: On failure

# lychee.sh

to install docker lychee

* [create_docker_lychee()](#createdockerlychee)
* [remove_docker_lychee()](#removedockerlychee)


## create_docker_lychee()

create docker lychee
link

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_lychee()

remove docker lychee

### Exit codes

* **0**: If successfull.
* **1**: On failure

# lodestone.sh

to install docker lodestone

* [create_docker_lodestone()](#createdockerlodestone)
* [remove_docker_lodestone()](#removedockerlodestone)


## create_docker_lodestone()

create docker lodestone
link

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_lodestone()

remove docker lodestone

### Exit codes

* **0**: If successfull.
* **1**: On failure

# jackett.sh

to install docker jackett

* [create_docker_jackett()](#createdockerjackett)
* [remove_docker_jackett()](#removedockerjackett)


## create_docker_jackett()

create docker jackett
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_jackett()

remove docker jackett

### Exit codes

* **0**: If successfull.
* **1**: On failure

# netdata.sh

to install docker netdata

* [create_docker_netdata()](#createdockernetdata)
* [remove_docker_netdata()](#removedockernetdata)


## create_docker_netdata()

create docker netdata
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_netdata()

remove docker netdata

### Exit codes

* **0**: If successfull.
* **1**: On failure

# glances.sh

to install docker glances

* [create_docker_glances()](#createdockerglances)
* [remove_docker_glances()](#removedockerglances)


## create_docker_glances()

create docker glances
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_glances()

remove docker glances

### Exit codes

* **0**: If successfull.
* **1**: On failure

# jupyterhub.sh

to install docker jupyterhub

* [create_docker_jupyterhub()](#createdockerjupyterhub)
* [remove_docker_jupyterhub()](#removedockerjupyterhub)


## create_docker_jupyterhub()

create docker jupyterhub
https://github.com/jupyterhub/jupyterhub-deploy-docker

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_jupyterhub()

remove docker jupyterhub

### Exit codes

* **0**: If successfull.
* **1**: On failure

# wallabag.sh

to install docker wallabag

* [create_docker_wallabag()](#createdockerwallabag)
* [remove_docker_wallabag()](#removedockerwallabag)


## create_docker_wallabag()

create docker wallabag
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_wallabag()

remove docker wallabag

### Exit codes

* **0**: If successfull.
* **1**: On failure

# wireguard.sh

to install docker wireguard

* [create_docker_wireguard()](#createdockerwireguard)
* [remove_docker_wireguard()](#removedockerwireguard)


## create_docker_wireguard()

create docker ubuntuxrdp
https://github.com/cmulk/wireguard-docker

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_wireguard()

remove docker wireguard

### Exit codes

* **0**: If successfull.
* **1**: On failure

# guacamole.sh

to install docker guacamole

* [create_docker_guacamole()](#createdockerguacamole)
* [remove_docker_guacamole()](#removedockerguacamole)


## create_docker_guacamole()

create docker guacamole
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_guacamole()

remove docker guacamole

### Exit codes

* **0**: If successfull.
* **1**: On failure

# spiderfoot.sh

to install docker spiderfoot

* [create_docker_spiderfoot()](#createdockerspiderfoot)
* [remove_docker_spiderfoot()](#removedockerspiderfoot)


## create_docker_spiderfoot()

create docker spiderfoot

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_spiderfoot()

remove docker spiderfoot

### Exit codes

* **0**: If successfull.
* **1**: On failure

# radarr.sh

to install docker radarr

* [create_docker_radarr()](#createdockerradarr)
* [remove_docker_radarr()](#removedockerradarr)


## create_docker_radarr()

create docker radarr

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_radarr()

remove docker radarr

### Exit codes

* **0**: If successfull.
* **1**: On failure




# bitwarden.sh

to install docker bitwarden

* [remove_docker_bitwarden()](#removedockerbitwarden)


## remove_docker_bitwarden()

remove docker bitwarden

### Exit codes

* **0**: If successfull.
* **1**: On failure

# graylog.sh

to install docker graylog

* [create_docker_graylog()](#createdockergraylog)
* [remove_docker_graylog()](#removedockergraylog)


## create_docker_graylog()

create docker graylog
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_graylog()

remove docker graylog

### Exit codes

* **0**: If successfull.
* **1**: On failure

# freshrss.sh

to install docker freshrss

* [create_docker_freshrss()](#createdockerfreshrss)
* [remove_docker_freshrss()](#removedockerfreshrss)


## create_docker_freshrss()

create docker freshrss
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_freshrss()

remove docker freshrss

### Exit codes

* **0**: If successfull.
* **1**: On failure

# qbittorrent-vpn.sh

to install docker qbittorrent-vpn

* [create_docker_qbittorrent-vpn()](#createdockerqbittorrent-vpn)
* [remove_docker_qbittorrent-vpn()](#removedockerqbittorrent-vpn)


## create_docker_qbittorrent-vpn()

create docker qbittorrent-vpn
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_qbittorrent-vpn()

remove docker qbittorrent-vpn

### Exit codes

* **0**: If successfull.
* **1**: On failure

# bookstack.sh

to install docker bookstack

* [create_docker_bookstack()](#createdockerbookstack)
* [remove_docker_bookstack()](#removedockerbookstack)


## create_docker_bookstack()

create docker bookstack
link

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_bookstack()

remove docker bookstack

### Exit codes

* **0**: If successfull.
* **1**: On failure

# komga.sh

to install docker komga

* [create_docker_komga()](#createdockerkomga)
* [remove_docker_komga()](#removedockerkomga)


## create_docker_komga()

create docker komga
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_komga()

remove docker komga

### Exit codes

* **0**: If successfull.
* **1**: On failure

# invidious.sh

to install docker invidious

* [create_docker_invidious()](#createdockerinvidious)
* [remove_docker_invidious()](#removedockerinvidious)


## create_docker_invidious()

create docker invidious
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_invidious()

remove docker invidious

### Exit codes

* **0**: If successfull.
* **1**: On failure

# tdarr.sh

to install docker tdarr

* [create_docker_tdarr()](#createdockertdarr)
* [remove_docker_tdarr()](#removedockertdarr)


## create_docker_tdarr()

create docker tdarr
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_tdarr()

remove docker tdarr

### Exit codes

* **0**: If successfull.
* **1**: On failure

# sonarr.sh

to install docker sonarr

* [create_docker_sonarr()](#createdockersonarr)
* [remove_docker_sonarr()](#removedockersonarr)


## create_docker_sonarr()

create docker sonarr

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_sonarr()

remove docker sonarr

### Exit codes

* **0**: If successfull.
* **1**: On failure

# duplicati.sh

to install docker duplicati

* [create_docker_duplicati()](#createdockerduplicati)
* [remove_docker_duplicati()](#removedockerduplicati)


## create_docker_duplicati()

create docker duplicati
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_duplicati()

remove docker duplicati

### Exit codes

* **0**: If successfull.
* **1**: On failure

# keycloak.sh

to install docker keycloak

* [create_docker_keycloak()](#createdockerkeycloak)
* [remove_docker_keycloak()](#removedockerkeycloak)


## create_docker_keycloak()

create docker keycloak
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_keycloak()

remove docker keycloak

### Exit codes

* **0**: If successfull.
* **1**: On failure

# jupyterlab.sh

to install docker jupyterlab

* [create_docker_jupyterlab()](#createdockerjupyterlab)
* [remove_docker_jupyterlab()](#removedockerjupyterlab)


## create_docker_jupyterlab()

create docker jupyterlab

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_jupyterlab()

remove docker jupyterlab

### Exit codes

* **0**: If successfull.
* **1**: On failure

# libresignature.sh

to install docker libresignature

* [create_docker_libresignature()](#createdockerlibresignature)
* [remove_docker_libresignage()](#removedockerlibresignage)


## create_docker_libresignature()

create docker libresignature
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_libresignage()

remove docker libresignage

### Exit codes

* **0**: If successfull.
* **1**: On failure

# cyberchef.sh

to install docker cyberchef

* [create_docker_cyberchef()](#createdockercyberchef)
* [remove_docker_cyberchef()](#removedockercyberchef)


## create_docker_cyberchef()

create docker cyberchef
link

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_cyberchef()

remove docker cyberchef

### Exit codes

* **0**: If successfull.
* **1**: On failure

# liberapay.sh

to install docker liberapay

* [create_docker_liberapay()](#createdockerliberapay)
* [remove_docker_liberapay()](#removedockerliberapay)


## create_docker_liberapay()

create docker liberapay
link

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_liberapay()

remove docker liberapay

### Exit codes

* **0**: If successfull.
* **1**: On failure

# ubuntuxrdp.sh

to install docker ubuntuxrdp

* [create_docker_ubuntuxrdp()](#createdockerubuntuxrdp)
* [remove_docker_ubuntuxrdp()](#removedockerubuntuxrdp)


## create_docker_ubuntuxrdp()

create docker ubuntuxrdp
https://hub.docker.com/r/danielguerra/ubuntu-xrdp/

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_ubuntuxrdp()

remove docker ubuntuxrdp

### Exit codes

* **0**: If successfull.
* **1**: On failure

# piwigo.sh

to install docker piwigo

* [create_docker_piwigo()](#createdockerpiwigo)
* [remove_docker_piwigo()](#removedockerpiwigo)


## create_docker_piwigo()

create docker piwigo
link

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_piwigo()

remove docker piwigo

### Exit codes

* **0**: If successfull.
* **1**: On failure

# openvpn.sh

to install docker openvpn

* [create_docker_openvpn()](#createdockeropenvpn)
* [remove_docker_openvpn()](#removedockeropenvpn)


## create_docker_openvpn()

create docekr openvpn
https://github.com/kylemanna/docker-openvpn

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_openvpn()

remove docker openvpn

### Exit codes

* **0**: If successfull.
* **1**: On failure

# deluge.sh

to install docker deluge

* [create_docker_deluge()](#createdockerdeluge)
* [remove_docker_deluge()](#removedockerdeluge)


## create_docker_deluge()

create docker deluge
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_deluge()

remove docker deluge

### Exit codes

* **0**: If successfull.
* **1**: On failure

# jellyfin.sh

to install docker jellyfin

* [create_docker_jellyfin()](#createdockerjellyfin)
* [remove_docker_jellyfin()](#removedockerjellyfin)


## create_docker_jellyfin()

create docker jellyfin
https://github.com/linuxserver/docker-jellyfin

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_jellyfin()

remove docker jellyfin

### Exit codes

* **0**: If successfull.
* **1**: On failure

# heimdall.sh

to install docker heimdall

* [create_docker_heimdall()](#createdockerheimdall)
* [remove_docker_heimdall()](#removedockerheimdall)


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

## remove_docker_heimdall()

remove docker heimdall

### Exit codes

* **0**: If successfull.
* **1**: On failure

# mcmyadmin.sh

to install docker mcmyadmin

* [create_docker_mcmyadmin()](#createdockermcmyadmin)
* [remove_docker_mcmyadmin()](#removedockermcmyadmin)


## create_docker_mcmyadmin()

create docker mcmyadmin
https://github.com/linuxserver-archive/docker-mcmyadmin2

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_mcmyadmin()

remove docker mcmyadmin

### Exit codes

* **0**: If successfull.
* **1**: On failure

# shidori.sh

to install docker shidori

* [create_docker_go-shidori()](#createdockergo-shidori)
* [remove_docker_go-shiori()](#removedockergo-shiori)


## create_docker_go-shidori()

create docker shidori
not implemented yet
https://github.com/MohammadAlHajj/shidori

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_go-shiori()

remove docker go-shiori

### Exit codes

* **0**: If successfull.
* **1**: On failure

# calibre.sh

to install docker calibre

* [create_docker_calibre()](#createdockercalibre)
* [remove_docker_calibre()](#removedockercalibre)


## create_docker_calibre()

create docker calibre
link

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_calibre()

remove docker calibre

### Exit codes

* **0**: If successfull.
* **1**: On failure




# template.sh

to install docker template

* [create_docker_cloud-torrent()](#createdockercloud-torrent)
* [remove_docker_cloud-torrent()](#removedockercloud-torrent)
* [help_docker_cloud-torrent()](#helpdockercloud-torrent)


## create_docker_cloud-torrent()

create docker template
link

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_cloud-torrent()

remove docker .template
link

### Exit codes

* **0**: If successfull.
* **1**: On failure

## help_docker_cloud-torrent()

help for the server and docker container
link

### Exit codes

* **0**: If successfull.
* **1**: On failure




# tautulli.sh

to install docker tautulli

* [create_docker_tautulli()](#createdockertautulli)
* [remove_docker_tautulli()](#removedockertautulli)


## create_docker_tautulli()

create docker tautulli
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_tautulli()

remove docker tautulli

### Exit codes

* **0**: If successfull.
* **1**: On failure




# medusa.sh

to install docker medusa

* [create_docker_medusa()](#createdockermedusa)
* [remove_docker_medusa()](#removedockermedusa)


## create_docker_medusa()

create docker medusa
https://github.com/linuxserver/docker-medusa

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_medusa()

remove docker medusa

### Exit codes

* **0**: If successfull.
* **1**: On failure

# dailynotes.sh

to install docker dailynotes

* [create_docker_dailynotes()](#createdockerdailynotes)
* [remove_docker_dailynotes()](#removedockerdailynotes)


## create_docker_dailynotes()

create docker dailynotes

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_dailynotes()

remove docker dailynotes

### Exit codes

* **0**: If successfull.
* **1**: On failure

# airsonic.sh

to install docker airsonic

* [create_docker_airsonic()](#createdockerairsonic)
* [remove_docker_airsonic()](#removedockerairsonic)


## create_docker_airsonic()

create docker airsonic
link

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_airsonic()

remove docker airsonic

### Exit codes

* **0**: If successfull.
* **1**: On failure

# couchpotato.sh

to install docker couchpotato

* [create_docker_couchpotato()](#createdockercouchpotato)
* [remove_docker_couchpotato()](#removedockercouchpotato)


## create_docker_couchpotato()

create docker couchpotato
link

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_couchpotato()

remove docker couchpotato

### Exit codes

* **0**: If successfull.
* **1**: On failure

# minecraft.sh

to install docker minecraft

* [create_docker_minecraft()](#createdockerminecraft)
* [remove_docker_minecraft()](#removedockerminecraft)


## create_docker_minecraft()

create docker minecraft
link

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_minecraft()

remove docker minecraft

### Exit codes

* **0**: If successfull.
* **1**: On failure

# teamspeak.sh

to install docker teamspeak

* [create_docker_teamspeak()](#createdockerteamspeak)
* [remove_docker_teamspeak()](#removedockerteamspeak)


## create_docker_teamspeak()

create docker teamspeak
https://github.com/recalbox/recalbox-docker-build

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_teamspeak()

remove docker teamspeak

### Exit codes

* **0**: If successfull.
* **1**: On failure

# firefly-iii.sh

to install docker firefly-iii

* [create_docker_firefly-iii()](#createdockerfirefly-iii)
* [remove_docker_firefly-iii()](#removedockerfirefly-iii)


## create_docker_firefly-iii()

create docker firefly-iii
https://github.com/firefly-iii/docker

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_firefly-iii()

remove docker firefly-iii

### Exit codes

* **0**: If successfull.
* **1**: On failure

# syncthing.sh

to install docker syncthing

* [create_docker_syncthing()](#createdockersyncthing)
* [remove_docker_syncthing()](#removedockersyncthing)


## create_docker_syncthing()

create docker syncthing
https://github.com/syncthing/syncthing

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_syncthing()

remove docker syncthing

### Exit codes

* **0**: If successfull.
* **1**: On failure

# paperless.sh

to install docker paperless

* [create_docker_paperless()](#createdockerpaperless)
* [remove_docker_paperless()](#removedockerpaperless)


## create_docker_paperless()

create docker paperless
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_paperless()

remove docker paperless

### Exit codes

* **0**: If successfull.
* **1**: On failure

# drawio.sh

to install docker drawio

* [create_docker_drawio()](#createdockerdrawio)
* [remove_docker_drawio()](#removedockerdrawio)


## create_docker_drawio()

create docker drawio
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_drawio()

remove docker drawio

### Exit codes

* **0**: If successfull.
* **1**: On failure

# huginn.sh

to install docker huginn

* [create_docker_huginn()](#createdockerhuginn)
* [remove_docker_huginn()](#removedockerhuginn)


## create_docker_huginn()

create docker huginn
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_huginn()

remove docker huginn

### Exit codes

* **0**: If successfull.
* **1**: On failure

# opentogethertube.sh

to install docker opentogethertube

* [create_docker_olaris()](#createdockerolaris)
* [remove_docker_opentogethertube()](#removedockeropentogethertube)


## create_docker_olaris()

create docker opentogethertube
https://github.com/antoinebou13/opentogethertube/tree/docker

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_opentogethertube()

remove docker opentogethertube

### Exit codes

* **0**: If successfull.
* **1**: On failure

# jenkins.sh

to install docker jenkins

* [create_docker_jenkins()](#createdockerjenkins)
* [remove_docker_jenkins()](#removedockerjenkins)


## create_docker_jenkins()

create docker jenkins
https://github.com/jenkinsci/docker

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_jenkins()

remove docker jenkins

### Exit codes

* **0**: If successfull.
* **1**: On failure




# mailcow.sh

to install dockermailcow

* [create_docker_mailcow()](#createdockermailcow)
* [remove_docker_mailcow()](#removedockermailcow)


## create_docker_mailcow()

create docker mailcow
https://github.com/mailcow/mailcow-dockerized
https://mailcow.github.io/mailcow-dockerized-docs/i_u_m_install/

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_mailcow()

remove docker mailcow

### Exit codes

* **0**: If successfull.
* **1**: On failure

# chevereto.sh

to install docker chevereto

* [create_docker_chevereto()](#createdockerchevereto)
* [remove_docker_chevereto()](#removedockerchevereto)


## create_docker_chevereto()

create docker chevereto

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_chevereto()

remove docker chevereto

### Exit codes

* **0**: If successfull.
* **1**: On failure

# .template.sh

to install docker .template



# mango.sh

to install docker mango

* [create_docker_mango()](#createdockermango)
* [remove_docker_mango()](#removedockermango)


## create_docker_mango()

create docker mango
link

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_mango()

remove docker mango

### Exit codes

* **0**: If successfull.
* **1**: On failure

# pyload.sh

to install docker pyload

* [create_docker_pyload()](#createdockerpyload)
* [remove_docker_lychee()](#removedockerlychee)


## create_docker_pyload()

create docker syncthing
https://github.com/linuxserver/docker-pyload/

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_lychee()

remove docker lychee

### Exit codes

* **0**: If successfull.
* **1**: On failure

# gitea.sh

to install docker gitea

* [create_docker_gitea()](#createdockergitea)
* [remove_docker_gitea()](#removedockergitea)


## create_docker_gitea()

create docker gitea
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_gitea()

remove docker gitea

### Exit codes

* **0**: If successfull.
* **1**: On failure




# monica.sh

to install docker monica

* [create_docker_monica()](#createdockermonica)
* [remove_docker_monica()](#removedockermonica)


## create_docker_monica()

create docker monica
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_monica()

remove docker monica

### Exit codes

* **0**: If successfull.
* **1**: On failure




# traefik

to install docker traefik

* [create_docker_traefik()](#createdockertraefik)
* [remove_docker_traefik()](#removedockertraefik)


## create_docker_traefik()

create docker traefik
link

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_traefik()

remove docker traefik

### Exit codes

* **0**: If successfull.
* **1**: On failure

# statping.sh

to install docker statping

* [create_docker_statping()](#createdockerstatping)
* [remove_docker_statping()](#removedockerstatping)


## create_docker_statping()

create docker statping
https://github.com/hunterlong/statping/wiki/Docker

### Arguments

* # @args $1 PORT_WEB
* # @args $2 PATH_STATPING

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_statping()

remove docker statping

### Exit codes

* **0**: If successfull.
* **1**: On failure

# openldap.sh

to install docker openldap

* [create_docker_openldap()](#createdockeropenldap)
* [remove_docker_openldap()](#removedockeropenldap)


## create_docker_openldap()

create docker openldap
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_openldap()

remove docker openldap

### Exit codes

* **0**: If successfull.
* **1**: On failure




# nextcloud.sh

to install docker nextcloud

* [create_docker_nextcloud()](#createdockernextcloud)
* [remove_docker_nextcloud()](#removedockernextcloud)


## create_docker_nextcloud()

create docker nextcloud
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_nextcloud()

remove docker nextcloud

### Exit codes

* **0**: If successfull.
* **1**: On failure

# olaris.sh

to install docker folaris

* [create_docker_olaris()](#createdockerolaris)
* [remove_docker_olaris()](#removedockerolaris)


## create_docker_olaris()

create docker olaris
https://gitlab.com/olaris/olaris-server

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_olaris()

remove docker olaris

### Exit codes

* **0**: If successfull.
* **1**: On failure

# plex.sh

to install docker plex

* [create_docker_plex()](#createdockerplex)
* [remove_docker_plex()](#removedockerplex)


## create_docker_plex()

create docker plex
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_plex()

remove docker plex

### Exit codes

* **0**: If successfull.
* **1**: On failure

# cloud-torrent.sh

to install docker cloud-torrent

* [create_docker_cloud-torrent()](#createdockercloud-torrent)
* [remove_docker_cloud-torrent()](#removedockercloud-torrent)


## create_docker_cloud-torrent()

create docker heimdall
https://github.com/jpillora/cloud-torrent

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_cloud-torrent()

remove docker cloud-torrent

### Exit codes

* **0**: If successfull.
* **1**: On failure

# linkd.sh

to install docker linkd

* [create_docker_linkd()](#createdockerlinkd)
* [remove_docker_linkd()](#removedockerlinkd)


## create_docker_linkd()

create docker linkd

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_linkd()

remove docker linkd

### Exit codes

* **0**: If successfull.
* **1**: On failure

# gitlab.sh

to install docker gitlab

* [create_docker_gitlab()](#createdockergitlab)
* [remove_docker_gitlab()](#removedockergitlab)


## create_docker_gitlab()

create docker gitlab
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_gitlab()

remove docker gitlab

### Exit codes

* **0**: If successfull.
* **1**: On failure

# neko.sh

to install docker neko

* [create_docker_neko()](#createdockerneko)
* [remove_docker_neko()](#removedockerneko)


## create_docker_neko()

create docker neko
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_neko()

remove docker neko

### Exit codes

* **0**: If successfull.
* **1**: On failure

# grafana.sh

to install docker grafana

* [create_docker_grafana()](#createdockergrafana)
* [remove_docker_grafana()](#removedockergrafana)


## create_docker_grafana()

create docker grafana
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_grafana()

remove docker grafana

### Exit codes

* **0**: If successfull.
* **1**: On failure

# osjs.sh

to install docker osjs

* [create_docker_osjs()](#createdockerosjs)
* [remove_docker_osjs()](#removedockerosjs)


## create_docker_osjs()

create docker osjs

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_osjs()

remove docker osjs

### Exit codes

* **0**: If successfull.
* **1**: On failure

# headphones.sh

to install docker headphones

* [create_docker_headphones()](#createdockerheadphones)
* [remove_docker_headphones()](#removedockerheadphones)


## create_docker_headphones()

create docker headphones
not implemented yet

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_docker_headphones()

remove docker headphones

### Exit codes

* **0**: If successfull.
* **1**: On failure

# container.sh

list of container and create/remove container and menu management

* [import_all_sh()](#importallsh)
* [manage_exec_containers_list()](#manageexeccontainerslist)
* [list_container()](#listcontainer)
* [list_src_images()](#listsrcimages)
* [generate_container_menu()](#generatecontainermenu)
* [generate_docker_compose_yml()](#generatedockercomposeyml)


## import_all_sh()

import all the /images/.../*.sh based on selected

### Arguments

* # @args $1 path of root of docker images
* # @args $2 name of the files
* # @args $1

### Exit codes

* **0**: If successfull.
* **1**: On failure

## manage_exec_containers_list()

manage exec containers sh in the images src do_as_docker_user

### Arguments

* # @args $1 SETUP_CONTAINER_MENU

### Exit codes

* **0**: If successfull.
* **1**: On failure

## list_container()

list of the container

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## list_src_images()

show the list of src images

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## generate_container_menu()

create CONTAINER_NAME_MENU

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## generate_docker_compose_yml()

generate a real docker-compose.yml with the template.yml
and the env variable

### Arguments

* # @args $1 template
* # @args $2 output docker compose

### Exit codes

* **0**: If successfull.
* **1**: On failure

# docker.sh

to install docker docker compose on ubuntu18.04

* [install_docker()](#installdocker)
* [install_docker_compose()](#installdockercompose)
* [install_docker_extra()](#installdockerextra)
* [prune_images_volumes_all()](#pruneimagesvolumesall)
* [stop_containers_all()](#stopcontainersall)
* [remove_containers_all()](#removecontainersall)
* [udocker_create_default_dir()](#udockercreatedefaultdir)
* [create_docker_user()](#createdockeruser)
* [do_as_udocker_user()](#doasudockeruser)
* [udocker_create_dir()](#udockercreatedir)
* [create_docker_id_backup()](#createdockeridbackup)
* [create_docker_name_backup()](#createdockernamebackup)
* [create_docker_backup_all()](#createdockerbackupall)
* [install_reverse_proxy()](#installreverseproxy)
* [add_subdomain()](#addsubdomain)


## install_docker()

install the docker

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## install_docker_compose()

install the docker compose

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## install_docker_extra()

install the docker extra utils dry

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## prune_images_volumes_all()

prune all the volumes and images

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## stop_containers_all()

stop all container

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## remove_containers_all()

stop all container

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## udocker_create_default_dir()

this  creates the volumes, services and backup directories. It then assisgns the current user to the ACL to give full read write access

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## create_docker_user()

create docker user and current user in the group and create dir

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## do_as_udocker_user()

do as the docker user

### Arguments

* # @args $1 command

### Exit codes

* **0**: If successfull.
* **1**: On failure

## udocker_create_dir()

create udocker dir

### Arguments

* # @args $1 directory path

### Exit codes

* **0**: If successfull.
* **1**: On failure

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

## install_reverse_proxy()

install_reverse_proxy

### Arguments

* # @args $# the backup of all the container names

### Exit codes

* **0**: If successfull.
* **1**: On failure

## add_subdomain()

add_subdomain

### Arguments

* # @args $# the backup of all the container names

### Exit codes

* **0**: If successfull.
* **1**: On failure

# firewall.sh

to manage the open port in the firewall

* [enable_firewall()](#enablefirewall)
* [disable_firewall()](#disablefirewall)
* [allow_port_in_firewall()](#allowportinfirewall)
* [deny_port_in_firewall()](#denyportinfirewall)


## enable_firewall()

enable firewall

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## disable_firewall()

disable firewall

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## allow_port_in_firewall()

allow a port in the firewall

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

## deny_port_in_firewall()

deny a port in the firewall

_Function has no arguments._

### Exit codes

* **0**: If successfull.
* **1**: On failure

# install.sh

install my favirote packages for ubuntu18.04 and tested

* [generate_apt_list_ubuntu()](#generateaptlistubuntu)
* [install_basic()](#installbasic)
* [install_cockpit()](#installcockpit)
* [install_ansible()](#installansible)
* [install_emojify()](#installemojify)
* [install_signal_cli()](#installsignalcli)
* [install_signal_ssh_text()](#installsignalsshtext)
* [manage_exec_install_list()](#manageexecinstalllist)


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

## install_ansible()

install ansible
 https://www.ansible.com

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

## manage_exec_install_list()

manage install menu

### Arguments

* # @args $1 SETUP_INSTALL_MENU

### Exit codes

* **0**: If successfull.
* **1**: On failure

