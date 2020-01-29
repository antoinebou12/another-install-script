#!/usr/bin/env bash
#
# @file container.sh
# @brief list of container and other info

declare -a CONTAINER_NAME_MENU=(
	"0-test-image" "0-test-image" "ON"
	"cloud-torrent" "cloud-torrent" "OFF"
	"deluge" "cloud-torrent" "OFF"
	"firefly-iii" "firefly-iii" "OFF"
	"gitea" "gitea" "OFF"
	"grafana" "grafana" "OFF"
	"guacamole" "guacamole" "OFF"
	"heimdall" "heimdall" "OFF"
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
	"neko" "neko" "OFF"
	"netdata" "netdata" "OFF"
	"nextcloud" "nextcloud" "OFF"
	"olaris" "olaris" "OFF"
	"openldap" "openldap" "OFF"
	"openvpn" "openvpn" "OFF"
	"paperless" "paperless" "OFF"
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

# @description manage exec containers sh in the images src do_as_docker_user
#
# @args $1 SETUP_CONTAINER_MENU
# @exitcode 0 If successfull.
# @exitcode 1 On failure
manage_exec_containers_list() {
	echo "Containers"
	print_line

	local FUNC_CREATE="create_docker_"
	touch /tmp/containers.txt
	containers=()
	mapfile -t containers <<<"$1"
	for container_name in "${containers[@]}"; do
		echo "$container_name"
		print_line
		exec_root echo "$container_name" >> /tmp/containers.txt
		source "src/docker/images/$container_name/$container_name.sh"
		"$FUNC_CREATE""$container_name"
		print_line
	done

	[ -d /home/udocker/ ] && cp /tmp/containers.txt /home/udocker/containers.txt

	return 0
	print_line
}

# @description list of the container
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
list_container() {
	docker inspect --format='{{.Name}}' $(exec_root docker ps -aq --no-trunc) | cut -c2-
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
