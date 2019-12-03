#!/usr/bin/env bash

print_nordvpn_status() {
    nordvpn status | sed -n -e 's/^Status: \(.*\)/\1/p'
}

print_nordvpn_status
