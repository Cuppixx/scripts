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
