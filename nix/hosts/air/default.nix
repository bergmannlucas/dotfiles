{
  imports = [
    ./apps.nix
    ./nix-core.nix
    ./system.nix
  ];

  networking.computerName = "air";
  system.defaults.smb.NetBIOSName = "air";

  users.users.bergmannlucas = {
    home = "/Users/bergmannlucas";
    name = "bergmannlucas";
    description = "bergmannlucas";
  };

  nix.settings.trusted-users = ["bergmannlucas"];

  system.stateVersion = 5;
}
