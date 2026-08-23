{
  description = "NixOS config for the old Zenbook";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    hyprmod = {
      url = "github:BlueManCZ/hyprmod";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, hyprmod, ... }: {
    nixosConfigurations.zenbook = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        { nixpkgs.overlays = [ hyprmod.overlays.default ]; }
        ./hosts/zenbook/configuration.nix
      ];
    };
  };
}
