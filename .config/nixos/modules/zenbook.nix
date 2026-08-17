{ config, pkgs, ... }:

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

  # nixpkgs.config.allowUnfree = true;
  # services.xserver.videoDrivers = [ "modesetting" "nvidia" ];
  # hardware.graphics.enable = true;
  # hardware.nvidia = {
  #   open = false;
  #   modesetting.enable = true;
  #   nvidiaSettings = true;
  #   prime = {
  #     offload.enable = true;
  #     intelBusId = "PCI:0@0:2:0";
  #     nvidiaBusId = "PCI:1@0:0:0";
  #   };
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;
  # };
}
