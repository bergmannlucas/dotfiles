{pkgs, ...}: {
  home.packages = with pkgs; [
    fnm
    ripgrep               
    oh-my-posh           
    btop                 
    htop                 
    stow                 
  ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
} 