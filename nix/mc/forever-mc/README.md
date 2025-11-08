# README

**This is a minimal build for Vanilla MC!**

## Commands

- **First run**: `nix run` - Builds the script, downloads latest Minecraft server, and starts it
- **Start server**: `./result/bin/start-server` - Starts the server with existing server.jar
- **Stop server**: Type `stop` in the server console and press Enter
- **Update Minecraft**: `rm server/server.jar && nix run` - Deletes old version and downloads latest

## Notes

- Once downloaded, the server.jar version stays the same until manually updated
- Server settings can be configured in `server/server.properties`
- Default Memory Settings: 1GB min, 2GB max (configurable in flake.nix)
