# README.md

- Get the nix-package-manager via: [`sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon`](https://nixos.org/download/)
- Enable experimental Nix feature 'nix-command':
  - `sudo nano /etc/nix/nix.conf` and add `experimental-features = nix-command flakes`
  - `sudo systemctl restart nix-daemon`
