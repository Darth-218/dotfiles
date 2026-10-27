{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    mpv
    vlc
    nomacs
    syncplay
    koreader
  ];
}
