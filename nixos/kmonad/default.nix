{ nixpkgs }:

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
        config = ./config/config.kbd;
      };
      wireless-kb = {
        device = "/dev/input/by-id/usb-YICHIP_Wireless_Device-event-kbd";
        config = ./config/wireless-config.kbd;
      };
      wired-kb = {
        device = "/dev/input/by-id/usb-EVISION_USB-STDHID_2020-12-15-event-kbd";
        config = ./config/wired-config.kbd;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    kmonad
  ];
}
