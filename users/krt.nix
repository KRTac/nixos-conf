{ pkgs, ... }:

{
  users.users.krt = {
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "disk"
      "audio"
      "video"
      "input"
    ];

    packages = with pkgs; [
      tree
    ];
  };
}