{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    bat
    blueman
    keepassxc
    pulseaudio
    libnotify
    localsend
    qbittorrent
    steam-run
    qalculate-gtk
    quickshell
  ];
}
