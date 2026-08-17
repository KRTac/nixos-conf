{ config, pkgs, ... }:

{
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
}
