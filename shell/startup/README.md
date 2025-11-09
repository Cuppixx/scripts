# README

## Add to autostart

To automatically run the startup script add a .desktop file into the autostart folder:
`nano ~/.config/autostart/startup.desktop`

The file looks like this:

```ini
[Desktop Entry]
Type=Application
Exec=/mnt/data/sourcecode/scripts/shell/startup/startup.sh
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Startup
```

## Setup: Konsole

Open Konsole and enable `Run all Konsole windows in a single process` in:
`Settings >> Configure Konsole >> General` for `--new-tab` to work correctly

## Setup: Spotify-Player and Spotify

Spotify-Player includes a built-in playback device powered by Librespot internally. If Spotify changes its API, Librespot (and therefore Spotify-Player's built-in device) may stop working for direct streaming. However, Spotify-Player can still function as a controller for the official Spotify desktop client, managing playback without relying on the built-in device.

**When Spotify-Player works use:**
`konsole --new-tab --workdir /home/cuppixx/Music/ -e fish -c "spotify_player"`

**When Spotify-Player doesn't work use:**
`spotify` and `konsole --new-tab --workdir /home/cuppixx/Music/ -e fish`
so you can manually start Spotify-Player to pick up the desktop client for playback

**Infos:**

- `spotify --minimized` only works on windows.
