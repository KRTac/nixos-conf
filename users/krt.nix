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

  systemd.user.services.nos-auto-update = {
    enable = false;
    description = "nos auto update service";
    wantedBy = [ "default.target" ];
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];
    serviceConfig = {
      User = "krt";
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash /home/krt/configs/dotfiles/scripts/nos.sh auto-update";
    };
  };

  systemd.user.timers.nos-auto-update = {
    wantedBy = [ "timers.target" ];
    wants = [ "network-online.target" ];
    after = [ "network-online.target" ];
    timerConfig = {
      OnUnitInactiveSec = "30m";
    };
  };
}