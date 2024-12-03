{
  pkgs,
  lib,
  ...
}: {
  # enable flakes
  nix.settings.experimental-features = "nix-command flakes";

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # auto upgrade nix package and the daemon service
  services.nix-daemon.enable = true;

  nix.package = pkgs.nix;
  
  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    options = lib.mkDefault "--delete-older-than 1w";
  };

  # Manual optimise storage: nix-store --optimise
  # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
  # nix.settings.auto-optimise-store = true;
}
