{ config, pkgs, lib, ... }:

{
  programs.hyprland.enable = true;

  services.greetd = {
    enable = true;

    settings = {
      initial_session = {
        command = "${pkgs.hyprland}/bin/start-hyprland";
        user = "krt";
      };
      default_session = {
        command = "${pkgs.hyprland}/bin/start-hyprland";
        user = "krt";
      };
    };
  };

  # hint Electron apps to use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
