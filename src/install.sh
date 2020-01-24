#!/usr/bin/env bash
#
# @file install.sh
# @brief install my favirote packages for ubuntu18.04 and tested

# import

# shellcheck source=utils.sh
# shellcheck disable=SC1091
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source "$DIR"/utils.sh

# @description change the source.list with template in /etc
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
generate_apt_list_ubuntu() {
    echo "Create Curated apt list"
    ../etc/source.list | tee /etc/apt/source.list
    return 0
}

# @description install the basic package to ubuntu I personnally like
#
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_basic() {
    echo "Install the basic packages"
    # apt-get ubuntu 18.04
    apt-get update -qq
    apt-get install snapd
    apt-get install -y bat nnn nmap wget curl bats mlocate mutt python3 python3-pip alsa-utils wireless-tools wpasupplicant zip unzip git cmake build-essential default-jre jq

    if [[ "$(checkWSL arg)" != "0" ]]; then
        # snap package
        snap install hub
    fi
    return 0
}

# @description install the cockpit to web
# See your server in a web browser and perform system tasks with a mouse. It’s easy to start containers, administer storage, configure networks, and inspect logs.
# https://cockpit-project.org/
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_cockpit() {
    echo "Install Cockpit"
    apt-get -qq update
    apt-get -q -y install cockpit cockpit-docker cockpit-machines cockpit-packagekit
    if [[ "$(checkWSL arg)" != "0" ]]; then
        systemctl restart cockpit
    fi
    return 0
}

# @description install the cockpit to web
#
# https://github.com/mrowa44/emojify
# @noargs
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_emojify() {
    echo "Install Emojify"
    sh -c "curl https://raw.githubusercontent.com/mrowa44/emojify/master/emojify -o /usr/local/bin/emojify && chmod +x /usr/local/bin/emojify"
}


# @description install the cockpit to web
# https://github.com/AsamK/signal-cli
#
# @args $1 username
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_signal_cli() {
    echo "Install Signal cli"
    wget https://github.com/AsamK/signal-cli/releases/download/v0.6.5/signal-cli-0.6.5.tar.gz
    sudo tar xf signal-cli-0.6.5.tar.gz -C /opt
    sudo ln -sf /opt/signal-cli-0.6.5/bin/signal-cli /usr/local/bin/
    signal-cli -u $1 register
    read CODE
    signal-cli -u $1 verify $CODE
    return 0
}

# @description install the cockpit to web
# https://8192.one/post/ssh_login_notification_signal/
#
# @args $1 phone number senders phone
# @args $2 phone number recipient
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_signal_ssh_text(){
    echo "Install Signal on login ssh"
    local DATE_EXEC="$(date "+%d %b %Y %H:%M")"
    local TMPFILE='/tmp/ipinfo-$DATE_EXEC.txt'
    if [ -n "$SSH_CLIENT" ] && [ -z "$TMUX" ]; then
        local IP=$(echo $SSH_CLIENT | awk '{print $1}') 
        local PORT=$(echo $SSH_CLIENT | awk '{print $3}') 
        local HOSTNAME=$(hostname -f) 
        local IPADDR=$(hostname -I | awk '{print $1}')
        curl https://ipinfo.io/$IP -s -o $TMPFILE 
        local CITY=$(cat $TMPFILE | sed -n 's/^  "city":[[:space:]]*//p' | sed 's/"//g') 
        local REGION=$(cat $TMPFILE | sed -n 's/^  "region":[[:space:]]*//p' | sed 's/"//g')
        local COUNTRY=$(cat $TMPFILE | sed -n 's/^  "country":[[:space:]]*//p' | sed 's/"//g')
        local ORG=$(cat $TMPFILE | sed -n 's/^  "org":[[:space:]]*//p' | sed 's/"//g')
        local TEXT="$DATE_EXEC: ${USER} logged in to $HOSTNAME ($IPADDR) from $IP - $ORG - $CITY, $REGION, $COUNTRY port $PORT"
        signal-cli  -u +$1 send -m "$TEXT" +$2
        rm $TMPFILE 
    fi
}
