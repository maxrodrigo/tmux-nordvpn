#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
source "$CURRENT_DIR/helpers.sh"

connected_text=$(get_tmux_option "@nordvpn_connected_text" "Connected")
connecting_text=$(get_tmux_option "@nordvpn_connecting_text" "Connecting")
disconnected_text=$(get_tmux_option "@nordvpn_disconnected_text" "Disconnected")

print_nordvpn_status() {
    status=$(nordvpn status | grep 'Status:\s.*')

    if [[ "$status" == *"Disconnected"* ]]; then
      echo "$disconnected_text"
    elif [[ "$status" == *"Connecting"* ]]; then
      echo "$connecting_text"
    elif [[ "$status" == *"Connected"* ]]; then
      echo "$connected_text"
    fi
}

print_nordvpn_status
