{pkgs, ...}: {
  # Install swaync via home-manager package
  home.packages = with pkgs; [
    swaynotificationcenter
  ];
}

