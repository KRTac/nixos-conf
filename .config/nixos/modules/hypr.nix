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

  environment.systemPackages = with pkgs; [
    hyprpaper
  ];

  environment.sessionVariables = {
    XDG_MENU_PREFIX = "plasma-";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "gtk3";
    QT_QPA_PLATFORMTHEME_QT6 = "gtk3";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";

    # hint Electron apps to use Wayland
    NIXOS_OZONE_WL = "1";
  };
}
