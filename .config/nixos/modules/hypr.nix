{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;

  services.greetd = {
    enable = true;

    settings = {
      initial_session = {
        command = "start-hyprland";
        user = "krt";
      };
    };
  };

  # hint Electron apps to use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
