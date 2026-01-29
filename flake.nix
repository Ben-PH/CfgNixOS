{
  description = "Ecosystem configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nvf.url = "github:notashelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, home-manager, nvf, ...} @ inputs: {
    nixosConfigurations = {
      spokii = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/spokii/configuration.nix
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.users.ben = import ./machines/homes/ben.nix;
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
        ];
        specialArgs = {inherit inputs;};
      };
      vbox = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/vbox/configuration.nix
          inputs.home-manager.nixosModules.home-manager
          {
            inputs.home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.ben = import ./home.nix;
            };
          }
        ];
        specialArgs = {inherit inputs;};
      };
      iso = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/iso/configuration.nix
        ];
        specialArgs = {inherit inputs;};
      };
    };
  };
}
