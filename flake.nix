{
  description = "NixOS config for the old Zenbook";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, ... }:
  let
    unstable = import nixpkgs-unstable {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations.zenbook = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        inherit unstable;
      };
      modules = [
        ./hosts/zenbook/configuration.nix
      ];
    };
  };
}
