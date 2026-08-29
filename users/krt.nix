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

  home-manager.users.krt = {
    home.stateVersion = "26.11";

    home.packages = with pkgs; [
      bat
      vscode
      discord
      code-nautilus
    ];

    home.sessionPath = [
      "$HOME/configs/dotfiles/scripts"
    ];
  };
}
