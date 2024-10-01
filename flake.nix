{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  {
    nixosConfigurations = {
      vbox = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  ./machines/vbox/configuration.nix
	  home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.ben = import ./home.nix;
	  }
        ];
        specialArgs = { inherit inputs ; };
      };
      spokii = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
	  ./machines/spokii/configuration.nix
	  home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.ben = import ./home.nix;
	  }
        ];
        specialArgs = { inherit inputs ; };
      };
    };
  };
}
