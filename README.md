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
set -g status-right 'NordVPN | status: #{nordvpn_status} - country: #{nordvpn_country}'
```

## Available Options

placeholder|display
-|-
`#{nordvpn_status}`		| connection status.
`#{nordvpn_server}`		| current server.
`#{nordvpn_country}`	| current connection country.
`#{nordvpn_city}`		| current connection city.


## Contributing

Contributions are welcome, and they are greatly appreciated! Every little bit helps, and credit will always be given.

The best way to send feedback is to file an issue at https://github.com/maxrodrigo/tmux-nordvpn/issues
