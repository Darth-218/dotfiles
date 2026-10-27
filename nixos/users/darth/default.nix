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

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib # This provides libstdc++.so.6
    # You can add other common libraries here if needed
    # zlib
    # libgcc
  ];
}

