{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.file.".config/niri" = { source = ./wm/niri; recursive = true; force = true; };
}