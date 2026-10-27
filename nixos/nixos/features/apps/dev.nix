{
  config,
  pkgs,
  lib,
  unstable,
  ...
}:

let
  zennotes = pkgs.callPackage ../zennotes.nix { };
in

{
  home.packages = with pkgs; [
    android-studio
    vscodium
    zed-editor-fhs
    unstable.opencode
    mysql-workbench
    openjdk21
    putty
    zennotes
    wireshark
    unstable.cisco-packet-tracer_9
    pandoc
  ];
}
