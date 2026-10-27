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
      wired-kb = {
        device = "/dev/input/by-id/usb-BY_Tech_Gaming_Keyboard-event-kbd";
        config = lib.readFile ./kbds/wired-config.kbd;
      };
      # wirels-kb = {
      #   device = "/dev/input/by-id/usb-Microsoft_Microsoft®_Nano_Transceiver_v2.0-event-kbd";
      #   config = lib.readFile ./kbds/wired-config.kbd;
      # };
    };
  };

  environment.systemPackages = with pkgs; [
    kmonad
  ];
}
