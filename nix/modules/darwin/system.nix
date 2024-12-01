{ pkgs, config, ... }: {
   # add ability to use TouchID for sudo
   security.pam.enableSudoTouchIdAuth = true;

   system = {
     defaults = {
       menuExtraClock.Show24Hour = true;

       dock = {
        autohide = true;
        show-recents = false;
        mru-spaces = false;

        #wvous-tl-corner = 2; # top-left - Mission Control
        #wvous-tr-corner = 13; # top-right - Lock Screen
        #wvous-bl-corner = 3; # bottom-left - Application Windows
        #wvous-br-corner = 4; # bottom-right - Desktop

        persistent-apps = [
          "/Applications/Notion Calendar.app"
          "${pkgs.spotify}/Applications/Spotify.app"
          "${pkgs.obsidian}/Applications/Obsidian.app"
          "/Applications/Todoist.app"
          "${pkgs.slack}/Applications/Slack.app"
          "/Applications/Brave Browser.app"
          "/Applications/kitty.app"
          "${pkgs.vscode}/Applications/Visual Studio Code.app"
          "/Applications/Insomnia.app"
          "/Applications/Docker.app"
          "${pkgs.dbeaver-bin}/Applications/DBeaver.app"
          "/Applications/Another Redis Desktop Manager.app"
        ];
      };

      finder = {
        _FXShowPosixPathInTitle = true;
        FXPreferredViewStyle = "clmv";
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        QuitMenuItem = true;
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      loginwindow.GuestEnabled = false;
      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
        AppleInterfaceStyle = "Dark";
        KeyRepeat = 2;
      };
    };
  };

  # Fonts
  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "JetBrainsMono"
        ];
      })
    ];
  };

  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = "/Applications";
    };
  in
    pkgs.lib.mkForce ''
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
}
