{
  config,
  pkgs,
  lib,
  ...
}:

{
  xdg.configFile."niri".source = ./wm/niri;
}