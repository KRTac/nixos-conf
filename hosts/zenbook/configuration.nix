let
  configRoot = ../..;
in
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "krtTop";

  imports = [
    ./hardware-configuration.nix
    "${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"
    ./disko-config.nix
    "${configRoot}/modules/common.nix"
    "${configRoot}/modules/fonts.nix"
    "${configRoot}/modules/packages.nix"
    "${configRoot}/modules/regional.nix"
    "${configRoot}/modules/zenbook.nix"
    "${configRoot}/users/root.nix"
    "${configRoot}/users/krt.nix"
    # "${configRoot}/modules/hypr.nix"
    "${configRoot}/modules/dmshell.nix"
  ];

  system.stateVersion = "26.05";
}
