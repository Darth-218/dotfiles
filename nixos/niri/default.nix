{ nixpkgs }:

{
  config,
  pkgs,
  lib,
  ...
}:

{
  xdg.configFile."niri".source = ./config/niri;
}
