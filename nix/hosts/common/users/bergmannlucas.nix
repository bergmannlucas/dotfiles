{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.bergmannlucas = {
    initialHashedPassword = "$y$j9T$HSWIH3Swkodg1mu1p8kmP.$BeYjMGu1IlSeYS.AoxJ4a4CORFaNc.oOnhS3lFhtKO7";
    isNormalUser = true;
    description = "bergmannlucas";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
    ];
    # TODO: generate openssh authorized keys
    # openssh.authorizedKeys.keys = [
    # ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.bergmannlucas =
    import ../../../home/bergmannlucas/${config.networking.hostName}.nix;
}