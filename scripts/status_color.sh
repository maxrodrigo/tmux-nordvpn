#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

disconnected_fg_color=$(get_tmux_option "@nordvpn_disconnected_fg_color" red)
connecting_fg_color=$(get_tmux_option "@nordvpn_connecting_fg_color" yellow)
connected_fg_color=$(get_tmux_option "@nordvpn_connected_fg_color" green)

disconnected_bg_color=$(get_tmux_option "@nordvpn_disconnected_bg_color")
connecting_bg_color=$(get_tmux_option "@nordvpn_connecting_bg_color")
connected_bg_color=$(get_tmux_option "@nordvpn_connected_bg_color")

print_nordvpn_status_color() {
    status=$(nordvpn status | sed -n -e 's/^Status: \(.*\)/\1/p')

    if [[ $status == "Disconnected" ]]; then
        echo "#[bg=${disconnected_bg_color}]#[fg=${disconnected_fg_color}]"
    elif [[ $status == "Connecting" ]]; then
        echo "#[bg=${connecting_bg_color}]#[fg=${connecting_fg_color}]"
    elif [[ $status == "Connected" ]]; then
        echo "#[bg=${connected_bg_color}]#[fg=${connected_fg_color}]"
    fi
}

print_nordvpn_status_color
