{pkgs, ...}: {
  environment.systemPackages = with pkgs; [ 
    mkalias 
    zsh 
    oh-my-posh 
    tmux 
    neovim
    stow 
    ripgrep 
    fzf
    obsidian 
    gh 
    k9s
    vscode 
    yazi 
    hugo 
    btop 
    htop 
    stats
    zoom-us 
    wget 
    slack 
    rectangle 
    dbeaver-bin
    spotify
  ];

  programs.zsh.enable = true;
  environment.shells = [
    pkgs.zsh
  ];
  
  homebrew = {
    enable = true;
    brews = [ 
      "mas" 
      "awscli-local" 
      "pyenv" 
      "virtualenv" 
      "pyenv-virtualenv" 
    ];
    casks = [ 
      "kitty" 
      "docker" 
      "insomnia" 
      "another-redis-desktop-manager" 
      "todoist" 
      "notion-calendar" 
      "brave-browser"
      "logi-options+"
    ];
    masApps = { 
      Vetero = 6449091332; 
    };
  };
}
