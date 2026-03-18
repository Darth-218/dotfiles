{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    mysql-workbench
  ];
}
