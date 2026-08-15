{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      nerd-fonts.noto
      nerd-fonts.liberation
      nerd-fonts.fira-code
      fira-code-symbols
      nerd-fonts.fira-mono
      fira-sans
      nerd-fonts.geist-mono
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      nerd-fonts.proggy-clean-tt
      liberation_ttf
      nerd-fonts.sauce-code-pro
      nerd-fonts.terminess-ttf
      googlesans-code
      roboto
      roboto-mono
      montserrat
      terminus_font
    ];
    fontconfig = {
      enable = true;
      allowBitmaps = true;
    };
  };

  environment.systemPackages = with pkgs; [
    gnome-font-viewer
  ];

  console.font = "Lat2-Terminus16";
}
