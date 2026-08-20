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
    description = "nos auto update service";
    wantedBy = [ "default.target" ];
    serviceConfig = {
      User = "krt";
      Type = "oneshot";
      ExecStart = "/home/krt/configs/dotfiles/scripts/nos.sh auto-update";
    };
  };

  systemd.user.timers.nos-auto-update = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnUnitInactiveSec = "30s";
    };
  };
}