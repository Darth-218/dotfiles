{
  config,
  lib,
  pkgs,
  ...
}:

{
  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_535;
    powerManagement.enable = true;
    open = lib.mkForce false;
  };

  hardware.nvidia.prime = {
    sync.enable = true;
    nvidiaBusId = "PCI:2:0:0";
    intelBusId = "PCI:0:2:0";
  };
}
