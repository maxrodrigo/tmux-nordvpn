#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"

commands=(
  "#($CURRENT_DIR/scripts/status.sh)"
  "#($CURRENT_DIR/scripts/server.sh)"
  "#($CURRENT_DIR/scripts/country.sh)"
  "#($CURRENT_DIR/scripts/city.sh)"
)

placeholders=(
  "\#{nordvpn_status}"
  "\#{nordvpn_server}"
  "\#{nordvpn_country}"
  "\#{nordvpn_city}"
)

do_interpolation() {
  local interpolated="$1"

  for i in ${!commands[@]} ; do
    interpolated=${interpolated/${placeholders[$i]}/${commands[$i]}}
  done

  echo "$interpolated"
}

update_tmux_option() {
  local option="$1"
  local option_value="$(get_tmux_option "$option")"
  local new_option_value="$(do_interpolation "$option_value")"
  set_tmux_option "$option" "$new_option_value"
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}

main
