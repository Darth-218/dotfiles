{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    podman
    qemu
    virt-manager
  ];
}
