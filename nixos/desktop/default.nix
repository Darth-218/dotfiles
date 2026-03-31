{ nixpkgs }:

{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    blender
    ghostty
    keepassxc
    libnotify
    libreoffice
    librewolf
    localsend
    mako
    mpv
    nomacs
    pulseaudio
    rofi
    scrcpy
    swaybg
    swaylock
    syncplay
    tuxguitar
    vesktop
    vlc
    wmenu
    xwayland-satellite
    zathura
    ollama
    opencode
  ];

  xdg.configFile = {
    "mako".source = ./config/mako;
    "ghostty".source = ./config/ghostty;
    "rofi".source = ./config/rofi;
    "opencode".source = ./config/opencode;
    "zathura".source = ./config/zathura;
  };
}
