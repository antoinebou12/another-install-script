#!/usr/bin/env bash
#
# @file container.sh
# @brief list of container and other info

FUNC_CREATE="create_docker"

declare -a CONTAINER_NAME_MENU=(
	"0-test-image" "0-test-image" "ON"
	"1-test-image" "1-test-image" "ON"
	"ansible" "ansible" "OFF"
	"cloud-torrent" "cloud-torrent" "OFF"
	"deluge" "cloud-torrent" "OFF"
	"firefly-iii" "firefly-iii" "OFF"
	"gitea" "gitea" "OFF"
	"gitlab" "gitlab" "OFF"
	"grafana" "grafana" "OFF"
	"guacamole" "guacamole" "OFF"
	"heimdall" "heimdall" "OFF"
	"hlsxmltv" "hlsxmltv" "OFF"
	"huginn" "huginn" "OFF"
	"jackett" "jackett" "OFF"
	"jellyfin" "jellyfin" "OFF"
	"jenkins" "jenkins" "OFF"
	"jupyterhub" "jupyterhub" "OFF"
	"keycloak" "keycloak" "OFF"
	"komga" "komga" "OFF"
	"libresignage" "libresignage" "OFF"
	"lidarr" "lidarr" "OFF"
	"mailcow" "mailcow" "OFF"
	"mcmyadmin" "mcmyadmin" "OFF"
	"medusa" "medusa" "OFF"
	"monica" "monica" "OFF"
	"mopidy" "mopidy" "OFF"
	"neko" "neko" "OFF"
	"netdata" "netdata" "OFF"
	"nextcloud" "nextcloud" "OFF"
	"olaris" "olaris" "OFF"
	"openldap" "openldap" "OFF"
	"openvpn" "openvpn" "OFF"
	"paperless" "paperless" "OFF"
	"pihole" "pihole" "OFF"
	"plex" "plex" "OFF"
	"pyload" "pyload" "OFF"
	"qbittorent-vpn" "qbittorent-vpn" "OFF"
	"radarr" "radarr" "OFF"
	"recalbox" "recalbox" "OFF"
	"sabnzbd" "sabnzbd" "OFF"
	"shidori" "shidori" "OFF"
	"sonarr" "sonarr" "OFF"
	"statping" "statping" "OFF"
	"syncthing" "syncthing" "OFF"
	"tautulli" "tautulli" "OFF"
	"tdarr" "tdarr" "OFF"
	"teamspeak" "teamspeak" "OFF"
	"traefik" "traefik" "OFF"
	"wallabag" "wallabag" "OFF"
)

# @description import all the /docker/images/.../*.sh based on selected
#
# @args $1 path of root of docker images
# @args $2 name of the files
# @args $1
# @exitcode 0 If successfull.
# @exitcode 1 On failure
import_all_sh() {
	find "$DIR/images" -name "*.sh" -execdir chmod u+x {} +
	local names=$(find "$1" -name "$2")

	local SAVEIFS="$IFS" # Save current IFS
	local IFS=$'\n'      # Change IFS to new line
	local names=($names) # split to array $names
	local IFS="$SAVEIFS" # Restore IFS

	for ((i = 0; i < ${#names[@]}; i++)); do
		echo "$i: ${names[$i]}"
		source "$DIR"/"${names[$i]}"
	done

	return 0
}

# @description manage exec containers sh in the images src
#
# @args $1 SETUP_CONTAINER_MENU
# @exitcode 0 If successfull.
# @exitcode 1 On failure
manage_exec_containers_list() {
	echo "$1"
	touch /tmp/containers.txt
	containers=()
	mapfile -t containers <<<"$1"
	for container_name in "${containers[@]}"; do
		echo "$container_name" >>/tmp/containers.txt
		source "src/docker/images/$container_name/$container_name.sh"
		do_as_docker_user "$FUNC_CREATE_$container_name"
	done
	return 0
}

# @description list of the container
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
list_container() {
	echo docker inspect --format='{{.Name}}' $(exec_root docker ps -aq --no-trunc) | cut -c2-
	return 0
}


# @description show the list of src images
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
list_src_images() {
	echo ls -a1 images
	return 0
}
