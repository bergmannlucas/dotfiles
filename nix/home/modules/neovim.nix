{pkgs, ...}: {
  # Neovim text editor configuration
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    extraPackages = with pkgs; [
      alejandra
      lua-language-server
      stylua
      gopls
      goimports-reviser
      golines
      typescript-language-server
      tailwindcss-language-server
    ];
  };
}
