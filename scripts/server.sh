#!/usr/bin/env bash

print_nordvpn_server() {
    nordvpn status | sed -n -e 's/^Current server: \(.*\)/\1/p'
}

print_nordvpn_server
