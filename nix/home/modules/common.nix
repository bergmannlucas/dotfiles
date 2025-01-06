{outputs, ...}: {
  imports = [
    ../modules/home.nix
    ./go.nix
    ./lazygit.nix
    ./neovim.nix
  ];

  # Nixpkgs configuration
  nixpkgs = {
    overlays = [
      outputs.overlays.stable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };
}

