{
  pkgs,
  lib,
  ...
}: let

in {
  imports = [
    ./swaync.nix
    ./waybar.nix
    ./wofi.nix
  ];
}

