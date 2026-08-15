{ config, pkgs, ... }:

let
  userEnv = (import ../env.nix).krt;
in
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