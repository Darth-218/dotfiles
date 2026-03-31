{
  config,
  lib,
  pkgs,
  ...
}:

{
  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [ "modesetting" "nvidia" ];

  boot.kernelParams = [
    "NvRemapPrimaryChipset"
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
    powerManagement.enable = true;
    open = lib.mkForce false;
  };

  hardware.nvidia.prime = {
    offload.enable = lib.mkForce true;
    nvidiaBusId = "PCI:2:0:0";
    intelBusId = "PCI:0:2:0";
  };
}
