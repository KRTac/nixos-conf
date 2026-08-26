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

    packages = with pkgs; [
      vscode
      discord
      code-nautilus
    ];
  };

  programs.firefox.enable = true;

  environment.extraInit = ''
    export PATH="$HOME/configs/dotfiles/scripts:$PATH"
  '';
}
