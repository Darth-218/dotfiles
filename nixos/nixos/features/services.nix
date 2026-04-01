{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    tailscale
    syncthing
    linux-wifi-hotspot
    wiremix
  ];
}