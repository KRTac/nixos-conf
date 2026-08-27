{
  description = "NixOS config for the old Zenbook";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, disko, ... }: {
    nixosConfigurations.zenbook = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        disko.nixosModules.disko
        ./hosts/zenbook/disko-config.nix
        ./hosts/zenbook/configuration.nix
      ];
    };
  };
}
