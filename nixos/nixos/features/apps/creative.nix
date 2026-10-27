{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    blender
    freecad
    kicad
    gimp
    shotcut
    tuxguitar
  ];
}
