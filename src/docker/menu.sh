#!/usr/bin/env bash

#
# @file up.sh
# @brief run and create all the selected docker container

# import

#get path of menu correct
pushd /home/docker

declare -A container_array=(
	[portainer]="Portainer"
	[nodered]="Node-RED"
	[influxdb]="InfluxDB"
	[telegraf]="Telegraf (Requires InfluxDB and Mosquitto)"
	[grafana]="Grafana"
	[mosquitto]="Eclipse-Mosquitto"
	[postgres]="Postgres"
	[mariadb]="MariaDB (MySQL fork)"
	[adminer]="Adminer"
	[openhab]="openHAB"
	[zigbee2mqtt]="zigbee2mqtt"
	[pihole]="Pi-Hole"
	[plex]="Plex media server"
	[tasmoadmin]="TasmoAdmin"
	[rtl_433]="RTL_433 to mqtt"
	[espruinohub]="EspruinoHub"
	[motioneye]="motionEye"
	[webthings_gateway]="Mozilla webthings-gateway"
	[blynk_server]="blynk-server"
	[nextcloud]="Next-Cloud"
	[nginx]="NGINX by linuxserver"
	[diyhue]="diyHue"
	[homebridge]="Homebridge"
	[python]="Python 3"

)