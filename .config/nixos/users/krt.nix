{ config, pkgs, ... }:

{
  users.users.krt = {
    shell = pkgs.fish;
    isNormalUser = true;
    extraGroups = [ "wheel" ];

    packages = with pkgs; [
      tree
    ];
  };
}