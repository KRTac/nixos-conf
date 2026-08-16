{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Zagreb";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_CTYPE = "en_US.UTF8";
    LC_ADDRESS = "hr_HR.UTF-8";
    LC_MEASUREMENT = "hr_HR.UTF-8";
    LC_MESSAGES = "en_US.UTF-8";
    LC_MONETARY = "hr_HR.UTF-8";
    LC_NAME = "hr_HR.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "hr_HR.UTF-8";
    LC_TELEPHONE = "hr_HR.UTF-8";
    LC_TIME = "hr_HR.UTF-8";
    LC_COLLATE = "hr_HR.UTF-8";
  };
  console = {
    keyMap = "croat";
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;
  services.power-profiles-daemon.enable = true;

  programs.firefox.enable = true;

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
  };

  environment.systemPackages = with pkgs; [
    git
    kitty
    stow
    playerctl
  ];

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  boot.kernelParams = [
    "consoleblank=120"
  ];

  # programs.dconf.profiles.user.databases = [
  #   {
  #     settings."org/gnome/desktop/interface" = {
  #       gtk-theme = "Adwaita";
  #       icon-theme = "Flat-Remix-Red-Dark";
  #       font-name = "Noto Sans Medium 11";
  #       document-font-name = "Noto Sans Medium 11";
  #       monospace-font-name = "Noto Sans Mono Medium 11";
  #     };
  #   }
  # ];
}
