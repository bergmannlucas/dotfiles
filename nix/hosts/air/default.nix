{ username, ... } @ args: 
let
  hostname = "air";
in {
  imports = [
    ../../modules/darwin
  ];

  # networking.hostname = hostname;
  networking.computerName = hostname;
  system.defaults.smb.NetBIOSName = hostname;

  users.users."${username}" = {
    home = "/Users/${username}";
    name = username;
    description = username;
  };

  nix.settings.trusted-users = [username];

  system.stateVersion = 5;
}


