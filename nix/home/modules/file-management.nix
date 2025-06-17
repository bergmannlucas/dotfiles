{pkgs, ...}: {
  home.packages = with pkgs; [
    yazi                 
    nautilus             
    nwg-look             
  ];
} 