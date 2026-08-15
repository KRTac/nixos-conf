{ config, pkgs, lib, ... }:

{
  programs.hyprland.enable = true;

  services.greetd = {
    enable = true;

    settings = {
      initial_session = {
        command = "${lib.getExe' config.programs.hyprland.package "start-hyprland"}";
        user = "krt";
      };
      default_session = {
        command = "${lib.getExe' config.programs.hyprland.package "start-hyprland"}";
        user = "krt";
      };
    };
  };

  programs.hyprlock.enable = true;
  services.hypridle.enable = true;

  # hint Electron apps to use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
