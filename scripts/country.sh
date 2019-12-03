#!/usr/bin/env bash

print_nordvpn_country() {
    nordvpn status | sed -n -e 's/^Country: \(.*\)/\1/p'
}

print_nordvpn_country
