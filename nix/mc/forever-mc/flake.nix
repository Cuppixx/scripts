{
  description = "Simple Vanilla Minecraft Server (latest)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.default = let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
      java = pkgs.openjdk21;
      name = "minecraft-server";

      startScript = pkgs.writeShellScriptBin "start-server" ''
        mkdir -p server
        cd server

        echo "Accepting EULA..."
        echo "eula=true" > eula.txt

        if [ ! -f server.jar ]; then
          echo "Downloading latest Minecraft server .jar..."
          curl -s https://launchermeta.mojang.com/mc/game/version_manifest.json |
            ${pkgs.jq}/bin/jq -r '.latest.release as $v | .versions[] | select(.id == $v) | .url' |
            xargs curl -s |
            ${pkgs.jq}/bin/jq -r '.downloads.server.url' |
            xargs curl -o server.jar
        fi

        echo "Starting Minecraft server..."
        ${java}/bin/java -Xmx2G -Xms1G -jar server.jar nogui
      '';
    in
      startScript;
  };
}
