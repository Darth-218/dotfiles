{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./modules/virtualization.nix
  ];

  home.username = "darth";
  home.homeDirectory = "/home/darth";
  home.stateVersion = "25.11";
}
