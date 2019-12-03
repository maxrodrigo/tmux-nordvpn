#!/usr/bin/env bash

print_nordvpn_city() {
    nordvpn status | sed -n -e 's/^City: \(.*\)/\1/p'
}

print_nordvpn_city
