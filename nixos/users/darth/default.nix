{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ../../nixos/features/shell.nix
    ../../nixos/features/editor.nix
    ../../nixos/features/desktop.nix
    ../../nixos/features/wm.nix
    ../../nixos/features/services.nix
    ../../nixos/features/keyboard.nix
  ];

  home.username = "darth";
  home.homeDirectory = "/home/darth";
  home.stateVersion = "25.11";
}