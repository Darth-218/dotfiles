{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    brightnessctl
    tailscale
    syncthing
    haveged
    linux-wifi-hotspot
    wiremix
  ];
}

