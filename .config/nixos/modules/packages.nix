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
    gdk-pixbuf
    ffmpeg
    ffmpegthumbnailer
    nautilus
    code-nautilus
    libpng
    libjpeg
    libheif
    libavif
    libjxl
    webp-pixbuf-loader
  ];
}
