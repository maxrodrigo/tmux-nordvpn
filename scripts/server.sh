#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
source "$CURRENT_DIR/helpers.sh"

exclude_server_domain=$(get_tmux_option "@nordvpn_exclude_server_domain" true)

print_nordvpn_server() {
    server=$(nordvpn status | sed -n -e 's/^Current server: \(.*\)/\1/p')

    if $exclude_server_domain; then
        echo ${server/.nordvpn.com/}
    else
        echo $server
    fi
}

print_nordvpn_server
