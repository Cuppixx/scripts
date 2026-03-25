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

When running a fish shell env and using the `config.fish` defined in `scripts/fish/` the `fish -c "source ~/.config/fish/config.fish; mc-backup"` command in `flake.nix` / `config.fish` can be **configured to automatically push** the `server/` folder to a private **github repository**.
Some files within the `server/` folder are modified on server start, stop (even after the post-exit command ran) or at runtime. **To catch file changes more reliably we can add the same command to the clients post-exit hook** (setable directly in the prismlauncher app for example). This executes the command both after the client quits and after the server stops. Keep in mind that this **still might not cover all file changes** since the execution order can be a bit weird sometimes.
