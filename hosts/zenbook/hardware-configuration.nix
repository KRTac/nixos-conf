{ config, lib, modulesPath, ... }: {
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [];

  # fileSystems."/" =
  #   { device = "/dev/disk/by-uuid/63864627-a0fb-4568-8406-86144a62f186";
  #     fsType = "ext4";
  #   };

  # fileSystems."/boot" =
  #   { device = "/dev/disk/by-uuid/0AC8-DEF2";
  #     fsType = "vfat";
  #     options = [ "fmask=0077" "dmask=0077" ];
  #   };

  # swapDevices =
  #   [ { device = "/dev/disk/by-uuid/b26168d7-b532-4309-9d0f-899ea9c3fae9"; }
  #   ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
