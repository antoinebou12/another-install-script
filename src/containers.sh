#!/usr/bin/env bash
#
# @file container.sh
# @brief list of container and create/remove container and menu management

# shellcheck source=utils.sh
# shellcheck disable=SC1091
source "$(dirname "${BASH_SOURCE[0]}")/utils.sh"

declare -a CONTAINER_NAME_MENU=()

# @description import all the /images/.../*.sh based on selected
#
# @args $1 path of root of docker images
# @args $2 name of the files
# @args $1
# @exitcode 0 If successfull.
# @exitcode 1 On failure
import_all_sh() {
	find "$(dirname "${BASH_SOURCE[0]}")/images" -name "*.sh" -execdir chmod u+x {} +
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


	export UDOCKER_USERID=$(id -u udocker)
    export UDOCKER_GROUPID=$(id -g udocker)
    export TZ=$(cat /etc/timezone)

	local FUNC_CREATE="create_docker_"
	touch /tmp/containers.txt
	containers=()
	mapfile -t containers <<<"$1"
	for container_name in "${containers[@]}"; do
		echo "$container_name"
		print_line
		exec_root echo "$container_name" >>/tmp/containers.txt
		source "$(dirname "${BASH_SOURCE[0]}")/images/$container_name/$container_name.sh"
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
	echo ls -a1 "$(dirname "${BASH_SOURCE[0]}")/images"
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
		CONTAINER_NAME_MENU+=("$col1")
		CONTAINER_NAME_MENU+=("$col2")
		if [[ -f /home/udocker/containers.txt ]]; then
			if grep -Fxq "$col1" /home/udocker/containers.txt; then
				CONTAINER_NAME_MENU+=("ON")
			else
				CONTAINER_NAME_MENU+=("OFF")
			fi
		else
			CONTAINER_NAME_MENU+=("OFF")
		fi
	done <"$(dirname "${BASH_SOURCE[0]}")/images/images.txt"
	IFS="$SAVEIFS" # Restore IFS
	return 0
}

