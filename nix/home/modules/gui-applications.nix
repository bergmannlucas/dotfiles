{pkgs, ...}: {
  home.packages = with pkgs; [
    spotify              
    obsidian             
    ghostty              
    vlc                  
  ];
} 