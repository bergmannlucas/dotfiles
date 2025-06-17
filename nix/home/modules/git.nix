{pkgs, userConfig, ...}: {
  home.packages = with pkgs; [
    git
    gh                    
  ];

  programs.git = {
    enable = true;
    userName = userConfig.fullName;
    userEmail = userConfig.email;
  };
} 