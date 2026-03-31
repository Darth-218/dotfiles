{
  config,
  lib,
  pkgs,
  ...
}:

{

  services.printing.enable = true;

  services.kmonad = {
    enable = true;
    keyboards = {
      laptop-kb = {
        device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
        config = builtins.readFile ./modules/kmonad/config.kbd;
      };
      wireless-kb = {
        device = "/dev/input/by-id/usb-YICHIP_Wireless_Device-event-kbd";
        config = builtins.readFile ./modules/kmonad/wireless-config.kbd;
      };
    };
  };

  services.tailscale.enable = true;

  services.openssh.enable = true;

  services.displayManager.ly.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.mysql.enable = true;
  services.mysql.package = pkgs.mysql80;
}
