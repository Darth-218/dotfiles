{
  config,
  lib,
  pkgs,
  ...
}:

{
  users.users.darth = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "uinput"
      "libvirtd"
    ];
    packages = with pkgs; [
      tree
    ];
  };
}
