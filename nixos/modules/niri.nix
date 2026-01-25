{config, pkgs, lib, ...}:

{
  home.packages = with pkgs; [
    xwayland-satellite
    librewolf
    keepassxc
    wmenu
    rofi
  ];
}
