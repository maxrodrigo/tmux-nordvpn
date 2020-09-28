<p align="center">
    <a href="https://github.com/maxrodrigo/tmux-nordvpn">
        <img src="assets/tmux-nordvpn-logo.png" alt="tmux-nordvpn logo" width="128">
    </a>
    <h3 align="center">NordVPN Tmux Plugin</h3>
    <p align="center">
        Monitor <a href="https://nordvpn.com/">NordVPN</a> connection status from Tmux.
    </p>
    <p align="center">
        <img alt="GitHub" src="https://img.shields.io/github/license/maxrodrigo/tmux-nordvpn">
    </p>
</p>

## Table of Contents

* [Getting Started](#getting-started)
    * [Installation](#installation)
    * [Requirements](#requirements)
* [Usage](#usage)
    * [Example](#example)
    * [Supported Format Strings](#supported-format-strings)
    * [Options](#options)
* [Status Update Interval](#status-update-interval)
* [Contributing](#contributing)

## Getting Started

### Installation

#### Tmux Plugin Manager (recommended)

Add plugin to the list of [TPM](https://github.com/tmux-plugins/tpm) plugins in `.tmux.conf`:

```sh
set -g @plugin 'maxrodrigo/tmux-nordvpn'
```

Hit `prefix + I` to fetch the plugin and source it.

If format strings are added to `status-right`, they should now be visible.

#### Manual Installation

Clone the repository:

```sh
git clone https://github.com/maxrodrigo/tmux-nordvpn ~/.tmux/tmux-nordvpn
```

Add this line to the bottom of `.tmux.conf`:

```txt
run-shell ~/.tmux/tmux-nordvpn/nordvpn.tmux
```

Reload Tmux environment:

```sh
tmux source-file ~/.tmux.conf
```

If format strings are added to `status-right`, they should now be visible.

### Requirements

The plugin relays on the NordVPN native application to pull the current status.
The command line tool is required.

NordVPN setup tutorials: https://support.nordvpn.com/FAQ/Setup-tutorials/

## Usage

Add the available format strings to the existing `status-right` or `status-left` Tmux option.

### Example

```sh
set -g status-right 'NordVPN: #{nordvpn_status_color}#{nordvpn_status} (#{nordvpn_country})'
```

### Supported Format Strings

- `#{nordvpn_status}` - connection status.
- `#{nordvpn_server}` - current server.
- `#{nordvpn_country}` - current connection country.
- `#{nordvpn_city}` - current connection city.
- `#{nordvpn_status_color}` - change foreground and background color based on the VPN status.

### Options

Here are all available options with their default values.

```sh
@nordvpn_exclude_server_domain true # remove "nordvpn.com" from the server name.

@nordvpn_connected_text "Connected" # text to display when connected
@nordvpn_connecting_text "Connecting" # text to display when connecting
@nordvpn_disconnected_text "Disconnected" # text to display when disconnected

@nordvpn_connected_fg_color "green" # foreground color when connected.
@nordvpn_connecting_fg_color "yellow" # foreground color when connecting.
@nordvpn_disconnected_fg_color "red" # foreground color when disconnected.

@nordvpn_connected_bg_color "" # background color when connected.
@nordvpn_connecting_bg_color "" # background color when connecting.
@nordvpn_disconnected_bg_color "" # background color when disconnected.
```

You can set any of these options in your `.tmux.conf`, for example:

```sh
set -g @nordvpn_exclude_server_domain false
set -g @nordvpn_connected_text 🍏
set -g @nordvpn_connecting_text 🍊
set -g @nordvpn_disconnected_text 🍅
```

## Status Update Interval

Status update won't be instant. The duration depends on the `status-interval` Tmux option. You can set `status-interval` to a low number to make the refresh faster.

```sh
set -g status-interval 5
```

## Contributing

Contributions are welcome, and they are greatly appreciated! Every little bit helps, and credit will always be given.

The best way to send feedback is to file an issue at https://github.com/maxrodrigo/tmux-nordvpn/issues
