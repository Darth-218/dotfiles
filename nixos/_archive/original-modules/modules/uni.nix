{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    mysql84
    mysql-workbench
  ];
}
