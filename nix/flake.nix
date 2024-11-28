{
  description = "Bergmann nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      nixpkgs.config.allowUnfree = true;
      environment.systemPackages = [ 
        pkgs.mkalias
        pkgs.kitty
        pkgs.zsh
        pkgs.oh-my-posh
        pkgs.tmux
        pkgs.neovim
        pkgs.stow
        pkgs.ripgrep
        pkgs.fzf
        pkgs.obsidian
        pkgs.gh
        pkgs.k9s
        pkgs.vscode
        pkgs.yazi
        pkgs.hugo
        pkgs.btop
        pkgs.htop
        pkgs.stats
        pkgs.zoom-us
        pkgs.wget
        pkgs.slack
        pkgs.rectangle
        pkgs.dbeaver-bin
        pkgs.spotify
      ];
      
      fonts.packages = with pkgs; [
        (nerdfonts.override {fonts = ["JetBrainsMono"];})
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
          "docker"
          "insomnia"
          "another-redis-desktop-manager"
          "todoist"
          "notion-calendar"
          "brave-browser"
        ];
        taps = [
        ];
        masApps = {
          Vetero = 6449091332;
        };
      };

      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in
        pkgs.lib.mkForce ''
          # Set up applications.
          echo "setting up /Applications..." >&2
          rm -rf /Applications/Nix\ Apps
          mkdir -p /Applications/Nix\ Apps
          find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
          while read -r src; do
            app_name=$(basename "$src")
            echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
          done
        '';

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      system.defaults = {
        dock.autohide = true;
        dock.persistent-apps = [
          "/Applications/Notion Calendar.app"
          "${pkgs.spotify}/Applications/Spotify.app"
          "${pkgs.obsidian}/Applications/Obsidian.app"
          "/Applications/Todoist.app"
          "${pkgs.slack}/Applications/Slack.app"
          "/Applications/Brave Browser.app"
          "${pkgs.kitty}/Applications/kitty.app"
          "${pkgs.vscode}/Applications/Visual Studio Code.app"
          "/Applications/Insomnia.app"
          "/Applications/Docker.app"
          "${pkgs.dbeaver-bin}/Applications/DBeaver.app"
          "/Applications/Another Redis Desktop Manager.app"
        ];
        finder.FXPreferredViewStyle = "clmv";
        loginwindow.GuestEnabled = false;
        NSGlobalDomain.AppleICUForce24HourTime = true;
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.KeyRepeat = 2;
      };

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#air
    darwinConfigurations."air" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "bergmannlucas";
            autoMigrate = true;
          };
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."air".pkgs;
  };
}
