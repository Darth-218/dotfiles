{
  config,
  pkgs,
  lib,
  zen-browser,
  ...
}:

{
  home.packages = with pkgs; [
    anydesk
    thunderbird
    vesktop
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    zoom-us
  ];
}
