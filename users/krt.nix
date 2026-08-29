{ pkgs, ... }: {
  users.users.krt = {
    initialPassword = "12345";
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
  };

  programs.firefox.enable = true;

  home-manager.users.krt = { config, ... }: {
    home.stateVersion = "26.11";

    programs.fish.enable = true;
    programs.bash.enable = true;

    home.packages = with pkgs; [
      bat
      vscode
      discord
      code-nautilus
    ];

    home.sessionPath = [
      "${config.home.homeDirectory}/configs/dotfiles/scripts"
    ];
  };
}
