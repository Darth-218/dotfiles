{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    kmonad
    tmux
    gcc
    syncthing
    keepassxc-go
    brightnessctl
    btop
    bluez
    blueman
    efibootmgr
    sesh
    lazygit
    linux-wifi-hotspot
    python315
    zoxide
  ];
}
