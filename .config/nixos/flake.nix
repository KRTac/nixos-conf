{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations.zenbook = nixpkgs.lib.nixosSystem {
      modules = [ ./hosts/zenbook/configuration.nix ];
    };
  };
}

