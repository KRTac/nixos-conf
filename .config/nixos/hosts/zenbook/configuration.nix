{ config, pkgs, ... }:

let
  configRoot = ../..;
in
{

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "krtTop";

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", GROUP="video", MODE="0666", RUN+="${pkgs.coreutils}/bin/chmod a+w /sys/class/backlight/%k/brightness"
  '';

  services.libinput.touchpad = {
    accelSpeed = "0.7";
    accelProfile = "adaptive";
    tapping = true;
    naturalScrolling = true;
  };

  imports =
    [
      ./hardware-configuration.nix
      "${configRoot}/modules/common.nix"
      "${configRoot}/modules/fonts.nix"
      "${configRoot}/modules/ssh.nix"
      "${configRoot}/users/root.nix"
      "${configRoot}/users/krt.nix"
      # "${configRoot}/modules/hypr.nix"
      "${configRoot}/modules/dmshell.nix"
    ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
