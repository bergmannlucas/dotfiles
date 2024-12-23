{
  inputs,
  outputs,
  lib,
  config,
  userConfig,
  pkgs,
  ...
}: {
  # Nixpkgs configuration
  nixpkgs = {
    overlays = [
      outputs.overlays.stable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  # Register flake inputs for nix commands
  nix.registry = lib.mapAttrs (_: flake: {inherit flake;}) (lib.filterAttrs (_: lib.isType "flake") inputs);

  # Add inputs to legacy channels
  nix.nixPath = ["/etc/nix/path"];
  environment.etc =
    lib.mapAttrs' (name: value: {
      name = "nix/path/${name}";
      value.source = value.flake;
    })
    config.nix.registry;

  # Nix settings
  nix.settings = {
    experimental-features = "nix-command flakes";
    auto-optimise-store = true;
  };

  # Boot settings
  boot = {
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
      };
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };

  # Networking
  networking.networkmanager.enable = true;

  # Timezone
  time.timeZone = "America/Sao_Paulo";

  # Internationalization
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Input settings
  services.libinput.enable = true;

  # X11 settings
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # PATH configuration
  environment.localBinInPath = true;

  # Disable CUPS printing
  services.printing.enable = false;

  # Enable devmon for device management
  services.devmon.enable = true;

  # Enable PipeWire for sound
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # User configuration
  users.users.${userConfig.name} = {
    initialHashedPassword = "$y$j9T$HSWIH3Swkodg1mu1p8kmP.$BeYjMGu1IlSeYS.AoxJ4a4CORFaNc.oOnhS3lFhtKO7";
    isNormalUser = true;
    description = userConfig.fullName;
    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
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
    shell = pkgs.zsh;
  };

  # Passwordless sudo
  security.sudo.wheelNeedsPassword = false;

  # System packages
  environment.systemPackages = with pkgs; [
    vim 
    stow
    git
    ripgrep
    fzf
    yazi
    btop
    htop
    wget
    spotify
    gnumake
    gcc
    glib
    kitty
    zsh
    oh-my-posh
    tmux
    neovim
    obsidian
    gh 
    vscode 
    yazi 
    brave
    wofi
    waybar
  ];

  # Docker configuration
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless.enable = true;
  virtualisation.docker.rootless.setSocketVariable = true;

  # Zsh configuration
  programs.zsh.enable = true;

  # Hyprland
  programs.hyprland.enable = true;

  # Firefox
  programs.firefox.enable = true;

  # Fonts configuration
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Additional services
  services.locate.enable = true;
  services.locate.localuser = null;

  # OpenSSH daemon
  services.openssh.enable = true;
}
