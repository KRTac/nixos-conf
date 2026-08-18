{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
  ];

  services.libinput.touchpad = {
    accelSpeed = "0.7";
    accelProfile = "adaptive";
    tapping = true;
    naturalScrolling = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics.enable = true;
  hardware.nvidia = {
    open = false;
    branch = "legacy_580";
    modesetting.enable = true;
    nvidiaSettings = true;
    prime = {
      intelBusId = "PCI:0@0:2:0";
      nvidiaBusId = "PCI:1@0:0:0";
    };
  };
}
