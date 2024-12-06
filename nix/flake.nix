{
  description = "Bergmann's system configurations and modules";

  inputs = {
    # Nixpkgs
    # nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Unstable Packages
    # nixpkgs-stable.url = "github:NixOS/nixpkgs/nixpkgs-24.05";

    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.05-darwin";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    # Disko
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
  };

  outputs = {
    self,
    nixpkgs,
    # nixpkgs-stable,
    nixpkgs-darwin,
    nix-darwin,
    nix-homebrew,
    disko,
    home-manager,
    ...
  } @ inputs: let 
    inherit (self) outputs;

    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
  in {
    nixosConfigurations = {
      kazordoon = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/kazordoon
          inputs.disko.nixosModules.disko
        ];
      };
    };
    homeConfigurations = {
      "bergmannlucas@kazordoon" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/bergmannlucas/home.nix];
      };
    };

    darwinConfigurations = {
      air = nix-darwin.lib.darwinSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          ./hosts/air
          home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.bergmannlucas = import ./home/darwin/home.nix;
            # home-manager.extraSpecialArgs = {
            #   inherit inputs;
            #   meta = host;
            # };
          }
        ];
      };
    };
  };
}
