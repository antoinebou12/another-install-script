#!/usr/bin/env bash
#
# @file other.sh
# @brief file containing the utils for the project and other

# @description simple scp for downloading file for a remote dir scp/ssh
#
# @args $1 username@ip
# @args $2 file path on remote device
# @args $3 file path for the local device
# @exitcode 0 If successfull.
# @exitcode 1 On failure
download_scp() {
    scp "$1":"$2" "$3"
    return 0
}

# @description simple scp for downloading file for a remote dir scp/ssh
#
# @args $1 file path for the local device
# @args $2 username@ip
# @args $3 file path on remote device
# @exitcode 0 If successfull.
# @exitcode 1 On failure
upload_scp() {
    scp "$1" "$2":"$3"
    return 0
}

# @description check mimetype of a file
# @arg $1 file
# @exitcode 0 If successfull.
# @exitcode 1 On failure
get_mimetype() {
    file --mime-type "$1" | sed 's/.*: //'
    return 0
}

# @description send mail locally with heirloom-mailx
# @arg $1 email from
# @arg $2 email to
# @arg $3 email subject
# @arg $4 email body
# @arg $5 email attachement file
# @exitcode 0 If successfull.
# @exitcode 1 On failure
send_email() {
    # from="$1"
    local to="$2"
    local subject="$3"
    local body="$4"
    local attachment=$5

    echo "$body" | mutt -s "$subject" -a "$attachment" "$to"
    return 0
}

# @description install the signal-cli
# https://github.com/AsamK/signal-cli
#
# @args $1 username
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_signal_cli() {
    echo "Install Signal cli"
    print_line

    wget https://github.com/AsamK/signal-cli/releases/download/v0.6.5/signal-cli-0.6.5.tar.gz >/dev/null
    exec_root "tar xf signal-cli-0.6.5.tar.gz -C /opt" >/dev/null
    exec_root "ln -sf /opt/signal-cli-0.6.5/bin/signal-cli /usr/local/bin/" >/dev/null
    rm -rf signal-cli-0.6.5.tar.gz >/dev/null
    signal-cli -u "$1" register
    read -r CODE
    signal-cli -u "$1" verify "$CODE"

    print_line
    return 0
}

# @description install the cockpit to web
# https://8192.one/post/ssh_login_notification_signal/
#
# @args $1 phone number senders phone
# @args $2 phone number recipient
# @exitcode 0 If successfull.
# @exitcode 1 On failure
install_signal_ssh_text() {
    echo "Install Signal on login ssh"
    print_line

    local DATEEXEC="$(date "+%d %b %Y %H:%M")"
    local TMPFILE='/tmp/ipinfo-$DATEEXEC.txt'
    if [ -n "$SSH_CLIENT" ] && [ -z "$TMUX" ]; then
        local IP="$(echo "$SSH_CLIENT" | awk '{print $1}')"
        local PORT="$(echo "$SSH_CLIENT" | awk '{print $3}')"
        local HOSTNAME="$(hostname -f)"
        local IPADDR="$(hostname -I | awk '{print $1}')"

        curl https://ipinfo.io/"$IP" -s -o "$TMPFILE"

        local CITY="$(cat $TMPFILE | sed -n 's/^  "city":[[:space:]]*//p' | sed 's/"//g')"
        local REGION="$(cat $TMPFILE | sed -n 's/^  "region":[[:space:]]*//p' | sed 's/"//g')"
        local COUNTRY="$(cat $TMPFILE | sed -n 's/^  "country":[[:space:]]*//p' | sed 's/"//g')"
        local ORG="$(cat $TMPFILE | sed -n 's/^  "org":[[:space:]]*//p' | sed 's/"//g')"
        local TEXT="$DATEEXEC: ${USER} logged in to $HOSTNAME ($IPADDR) from $IP - $ORG - $CITY, $REGION, $COUNTRY port $PORT"
        signal-cli -u +"$1" send -m "$TEXT" +"$2"
        rm $TMPFILE
    fi

    print_line
    return 0
}