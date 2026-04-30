# README

**This is a minimal build for Vanilla MC!**

## Commands

- `nix run` - Builds the script, downloads latest Minecraft server, and starts it
- `nix build` - Builds the script without running it and creates the `result/` symlink
- `./result/bin/start-server` - Starts the server with existing server.jar
- `stop` - Stops the server when executed in the the server console
- `rm server/server.jar` and `nix run` - Deletes old version and downloads latest

## Notes

- Once downloaded, the **server.jar version** stays the same until manually updated
- **Server settings** can be configured in `server/server.properties`
- **Default Memory Settings**: 1GB min, 2GB max (configurable in flake.nix)
- **The `server` folder** is ignored by the parent repo by default
  - The server folder itself contains a separate **Git repo for backups**
  - This nested repo does not clash with the parent repo since the folder is in `.gitignore`
  - No submodule is required

## PostExit Command

When running a fish shell env with the `config.fish` defined in `scripts/fish/` the `fish -c "init-keychain; mc-backup"` command in `flake.nix`, `config.fish` can be **configured to automatically push** the `server/` folder to a private **github repository**.
