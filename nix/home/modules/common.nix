{outputs, ...}: {
  imports = [
    ../modules/home.nix
    ./go.nix
    ./lazygit.nix
    ./neovim.nix
    ./git.nix
    ./tmux.nix
    ./shell-tools.nix
    ./development.nix
    ./gui-applications.nix
    ./file-management.nix
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

