{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    bc # For running xv6
    pkgsCross.riscv64-embedded.buildPackages.gcc # For runninng xv6
    qemu
    virt-manager
  ];
}
