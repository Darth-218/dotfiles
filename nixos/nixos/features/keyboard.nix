{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.kmonad = {
    enable = true;
    keyboards = {
      laptop-kb = {
        device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
        config = lib.readFile ./kbds/config.kbd;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    kmonad
  ];
}