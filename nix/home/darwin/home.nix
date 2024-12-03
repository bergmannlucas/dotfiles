{ username, ... }: {
  imports = [
    ./apps.nix
    ./core.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "bergmannlucas";
    homeDirectory = "/Users/bergmannlucas";
    stateVersion = "23.11";
  };

  xdg.enable = true;
}
