{ inputs, ... }:
let
  configRoot = ../..;
in
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "krt-pc";

  imports = [
    ./hardware-configuration.nix

    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = "hm-bkp";
      home-manager.overwriteBackup = true;
      home-manager.extraSpecialArgs = {
        inherit inputs;
      };
    }

    "${configRoot}/modules/common.nix"
    "${configRoot}/modules/fonts.nix"
    "${configRoot}/modules/packages.nix"
    "${configRoot}/modules/regional.nix"
    "${configRoot}/modules/pc.nix"
    "${configRoot}/users/root.nix"
    "${configRoot}/users/krt.nix"
    # "${configRoot}/modules/hypr.nix"
    "${configRoot}/modules/dmshell.nix"
  ];

  system.stateVersion = "26.05";
}
