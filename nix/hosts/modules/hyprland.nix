{pkgs, ...}: {
  # Call dbus-update-activation-environment on login
  # services.xserver.updateDbusEnvironment = true;

  # Enables support for Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Enable Bluetooth support
  services.blueman.enable = true;

  # Enable Hyprland
  programs.hyprland = {
    enable = true;
  };

  # Enable security services
  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;
  security.pam.services = {
   hyprlock = {};
   gdm.enableGnomeKeyring = true;
  };

  # List of Hyprland specific packages
  environment.systemPackages = with pkgs; [
    hypridle
    hyprshot
    hyprlock
    hyprpaper
    libnotify
    networkmanagerapplet
    brightnessctl

    # GTK Themes
    tokyonight-gtk-theme
    papirus-icon-theme
  ];
}

