#!/usr/bin/env bash
#
# @file container.sh
# @brief list of container and create/remove container and menu management

# shellcheck source=config.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/config.sh"
# shellcheck source=firewall.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/firewall.sh"
# shellcheck source=utils.sh
# shellcheck disable=SC1091
source "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/utils.sh"

declare -a CONTAINER_NAME_MENU=()

# @description import all the /containers/.../*.sh based on selected
#
# @args $1 path of root of docker containers
# @args $2 name of the files
# @args $1
# @exitcode 0 If successfull.
# @exitcode 1 On failure
import_all_sh() {
	find "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)/containers" -name "*.sh" -execdir chmod u+x {} +
	local names="$(find "$1" -name "$2")"

	local SAVEIFS="$IFS" # Save current IFS
	local IFS=$'\n'      # Change IFS to new line
	local names=("$names") # split to array $names
	local IFS="$SAVEIFS" # Restore IFS

	for ((i = 0; i < ${#names[@]}; i++)); do
		echo "$i: ${names[$i]}"
		source "$DIR"/"${names[$i]}"
	done

	return 0
}

# @description manage exec containers sh in the containers src do_as_docker_user
#
# @args $1 SETUP_CONTAINER_MENU
# @exitcode 0 If successfull.
# @exitcode 1 On failure
manage_exec_containers_list() {
	print_newline
	echo "Containers"
	print_line

	UDOCKER_USERID="$(id -u udocker)"
	UDOCKER_GROUPID="$(id -g udocker)"
	TZ="$(cat /etc/timezone)"

	export UDOCKER_USERID
	export UDOCKER_GROUPID
	export TZ

	local FUNC_CREATE="create_docker_"
	touch /tmp/containers.txt
	containers=()
	mapfile -t containers <<<"$1"
	for container_name in "${containers[@]}"; do
		echo "$container_name"
		print_line
		exec_root "$container_name" >>/tmp/containers.txt
		source "$(dirname "${BASH_SOURCE[0]}")/containers/$container_name/$container_name.sh"
		"$FUNC_CREATE""$container_name"
		print_line
	done

	[ -d /home/udocker/ ] && cp /tmp/containers.txt /home/udocker/config/containers.txt

	manage_firewall_ports_allow_list
	
	return 0
	print_line
}

# @description list of the container
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
list_container() {
	docker inspect --format='{{.Name}}' "$(exec_root docker ps -aq --no-trunc)" | cut -c2-
	return 0
}

# @description show the list of src containers
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
list_src_containers() {
	echo ls -a1 "$(dirname "${BASH_SOURCE[0]}")/containers"
	return 0
}

# @description create CONTAINER_NAME_MENU
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
generate_container_menu() {
	SAVEIFS="$IFS" # Save current IFS
	IFS=,          # Change IFS to new line
	while IFS=, read -r col1 col2; do
		if [[ -f /home/udocker/containers.txt ]]; then
			if grep -Fxq "$col1" /home/udocker/conf/containers.txt; then
				echo 1
			else
				CONTAINER_NAME_MENU+=("$col1")
				CONTAINER_NAME_MENU+=("$col2")
				CONTAINER_NAME_MENU+=("OFF")
			fi
		else
			CONTAINER_NAME_MENU+=("$col1")
			CONTAINER_NAME_MENU+=("$col2")
			CONTAINER_NAME_MENU+=("OFF")
		fi
	done <"$(dirname "${BASH_SOURCE[0]}")/containers/containers.txt"
	IFS="$SAVEIFS" # Restore IFS
	return 0
}

# @description generate a real docker-compose.yml with the template.yml
# and the env variable
# @args $1 template
# @args $2 output docker compose
# @exitcode 0 If successfull.
# @exitcode 1 On failure
generate_docker_compose_yml() {
	envsubst <"$1" >"$2"
}

# @description create tar for running docker for a local backup
#
# @args $1 container id
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_container_id_backup() {
    echo "Create Docker Container Backup $1"
    print_line

    # shellcheck disable=SC2086,SC2143
    if [ ! "$(docker ps -a | grep $1)" ]; then
        container_name="$(docker ps | grep $1 | awk '{ print $2 }')"
        date_id="$(date +'%m/%d/%Y_%s')"
        container_backup="${container_name}_${date_id}_backup"
        docker commit -p "$1" "$container_backup"
        docker save -o /home/udocker/backups/"$container_backup".tar "$container_backup"
    fi

    print_line
    return 0
}

# @description create tar for running docker for a local backup
#
# @args $1 container container name
# @exitcode 0 If successfull.
# @exitcode 1 On failure
create_container_name_backup() {
    echo "Create Docker Container Backup $1"
    print_line

    # shellcheck disable=SC2086,SC2143
    if [ ! "$(docker ps -a | grep $1)" ]; then
        # shellcheck disable=SC2086
        container_name="$(docker ps | grep $1 | awk '{ print $1 }')"
        date_id=$(date +'%m/%d/%Y_%s')
        container_backup="${container_name}_${date_id}_backup"
        docker commit -p "$1" "$container_backup"
        docker save -o /home/udocker/backups/"$container_backup".tar "$container_backup"
    fi

    print_line
    return 0
}