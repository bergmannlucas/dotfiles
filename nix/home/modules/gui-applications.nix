{pkgs, ...}: {
  home.packages = with pkgs; [
    spotify              
    obsidian             
    brave                
    ghostty              
    vlc                  
  ];
} 