{
  description = "Bergmann's system configurations and modules";

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nix-darwin,
    nix-homebrew,
    home-manager,
    ...
  }: let 
    username = "bergmannlucas";
    userfullname = "Lucas Bergmann";
    useremail = "bergmannlcs@proton.me";

    x64_system = "x86_64-linux";
    x64_darwin = "aarch64-darwin";
    allSystems = [x64_system x64_darwin];

    #nixosSystem = import ./lib/nixosSystem.nix;
    macosSystem = import ./lib/macosSystem.nix;
  in {
    darwinConfigurations = let
      system = x64_darwin;
      specialArgs = {
        inherit username userfullname useremail;

        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      }
      // inputs;
      base_args = {
        inherit nix-darwin home-manager system specialArgs;
      };
    in {
      air = macosSystem (base_args // {
        darwin-modules = [
          ./hosts/air
        ];
        home-module = import ./home/darwin;
      });
    };

    # format the nix code in this flake
    # alejandra is a nix formatter with a beautiful output
    formatter = nixpkgs.lib.genAttrs allSystems (
      system:
        nixpkgs.legacyPackages.${system}.alejandra
    );
  };


  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.05-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
  };

  nixConfig = {
    experimental-features = "nix-command flakes";
  };
}
