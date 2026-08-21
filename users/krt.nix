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
    serviceConfig = {
      User = "krt";
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash /home/krt/configs/dotfiles/scripts/nos.sh auto-update";
    };
  };

  systemd.user.timers.nos-auto-update = {
    enable = false;
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnUnitInactiveSec = "30m";
    };
  };

  environment.extraInit = ''
    export PATH="$HOME/configs/dotfiles/scripts:$PATH"
  '';
}