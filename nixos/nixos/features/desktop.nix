{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./apps/dev.nix
    ./apps/creative.nix
    ./apps/media.nix
    ./apps/communication.nix
    ./apps/productivity.nix
    ./apps/system.nix
  ];

  home.packages = with pkgs; [
    ghostty
    mako
    rofi
    swaybg
    swaylock
    wmenu
    xwayland-satellite
  ];

  home.file = {
    ".config/mako" = {
      source = ./mako;
      recursive = true;
    };
    ".config/ghostty" = {
      source = ./ghostty;
      recursive = true;
    };
    ".config/rofi" = {
      source = ./rofi;
      recursive = true;
    };
    ".config/opencode" = {
      source = ./opencode;
      recursive = true;
    };
    ".config/zathura" = {
      source = ./zathura;
      recursive = true;
    };
  };
}
