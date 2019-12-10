# Tmux NordVPN Status

Tmux plugin to monitor [NordVPN](https://nordvpn.com/) connection status.

## Installation

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'maxrodrigo/tmux-nordvpn'

Hit `prefix + I` to fetch the plugin and source it.

If format strings are added to `status-right`, they should now be visible.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/maxrodrigo/tmux-nordvpn ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/nordvpn.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

If format strings are added to `status-right`, they should now be visible.

## Requirements

The plugin relays on the NordVPN native application to pull the current status.
The command line tool is required.

NordVPN setup tutorials: https://support.nordvpn.com/FAQ/Setup-tutorials/

## Usage

Add the available format strings to the existing `status-right` or `status-left` tmux option.
Example:

```
set -g status-right 'NordVPN | status: #{nordvpn_status_color}#{nordvpn_status} - country: #{nordvpn_country}'
```

## Supported Format Strings

- `#{nordvpn_status}` - connection status.
- `#{nordvpn_server}` - current server.
- `#{nordvpn_country}` - current connection country.
- `#{nordvpn_city}` - current connection city.
- `#{nordvpn_status_color}` - change foreground and background color based on the VPN status.

## Options

Here are all available options with their default values.

```
@nordvpn_exclude_server_domain true # remove "nordvpn.com" from the server name.

@nordvpn_disconnected_fg_color "red" # foreground color when disconnected.
@nordvpn_connecting_fg_color "yellow" # foreground color when connecting.
@nordvpn_connected_fg_color "green" # foreground color when connected.

@nordvpn_disconnected_bg_color "" # background color when disconnected.
@nordvpn_connecting_bg_color "" # background color when connecting.
@nordvpn_connected_bg_color "" # background color when connected.
```

You can set any of these options in your `.tmux.conf`, for example:

```
set -g @nordvpn_exclude_server_domain false
```

## Contributing

Contributions are welcome, and they are greatly appreciated! Every little bit helps, and credit will always be given.

The best way to send feedback is to file an issue at https://github.com/maxrodrigo/tmux-nordvpn/issues
