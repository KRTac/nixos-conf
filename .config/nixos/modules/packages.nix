{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    kitty
    ghostty
    stow
    playerctl
    bibata-cursors
    libnotify
    nixd
    vscode
    adw-gtk3
    tumbler
    ffmpegthumbnailer
    ffmpeg
    libpng
    libjpeg
    nautilus
  ];
}
