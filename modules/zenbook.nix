{ pkgs, ... }: {
  environment.variables.NOS_BUILD_HOSTNAME = "zenbook";
  environment.systemPackages = with pkgs; [
    brightnessctl
    hyprshutdown
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
      offload.enable = true;
      reverseSync.enable = false;
      intelBusId = "PCI:0@0:2:0";
      nvidiaBusId = "PCI:1@0:0:0";
    };
  };

  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=0"
  ];

  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      MaxAuthTries = 3;
    };
  };
}
