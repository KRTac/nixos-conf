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
    ];
    fontconfig = {
      enable = true;
      allowBitmaps = true;
    };
  };
}
