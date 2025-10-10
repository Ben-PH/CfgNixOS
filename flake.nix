{
  description = "Ecosystem configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # dora-rs = {
    #   url = "path:///home/ben/dora_pad/dora";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, ...} @ inputs: let
    systems = [
      # "aarch64-linux"
      # "i686-linux"
      "x86_64-linux"
      # "aarch64-darwin"
      # "x86_64-darwin"
    ];
    forAllSystems = inputs.nixpkgs.lib.genAttrs systems;
  in {
    formatter = forAllSystems (system: inputs.nixpkgs.legacyPackages.${system}.alejandra);
    nixosConfigurations = {
      spokii = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/spokii/configuration.nix
          # TODO: Make sense of the machine-sys-home divide
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.users.ben = import ./machines/homes/ben.nix;
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
