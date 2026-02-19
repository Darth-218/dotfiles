{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    ghostty
    keepassxc
    libnotify
    libreoffice
    librewolf
    mako
    mpv
    nomacs
    pulseaudio
    rofi
    swaybg
    swaylock
    syncplay
    vlc
    wmenu
    xwayland-satellite
    zathura
  ];
}
