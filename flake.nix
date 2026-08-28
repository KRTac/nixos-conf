{
  description = "NixOS config for the old Zenbook";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-26.05";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs-stable";
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-stable, ... }:
  let
    stable = import nixpkgs-stable {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.zenbook = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        inherit stable;
      };
      modules = [
        ./hosts/zenbook/configuration.nix
      ];
    };
  };
}
