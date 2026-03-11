{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "deathstar";

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  time.timeZone = "Africa/Cairo";

  # fileSystems."/mnt" =
  #   { device = "/dev/disk/by-uuid/6bc46aca-3150-4c01-9a67-68cf5fe3346f";
  #     fsType = "ext4";
  #   };

  hardware.graphics.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;

    modesetting.enable = true;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  services.printing.enable = true;

  # services.kmonad = {
  #   enable = true;
  #   keyboards = {
  #     laptop-kb = {
  #       device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
  #       config = builtins.readFile ./modules/kmonad/config.kbd;
  #     };
  #     wireless-kb = {
  #       device = "/dev/input/by-id/usb-YICHIP_Wireless_Device-event-kbd";
  #       config = builtins.readFile ./modules/kmonad/wireless-config.kbd;
  #     };
  #   };
  # };

  services.tailscale.enable = true;

  services.openssh.enable = true;
  services.displayManager.ly.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

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

  programs.niri.enable = true;
  programs.xwayland.enable = true;
  programs.firefox.enable = true;

  virtualisation.libvirtd.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    kmonad
    gnumake
    system-config-printer
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix = {
    settings = {
      max-jobs = 2;
    };
  };

  system.stateVersion = "25.11"; # NEVER EVER CHANGE
}
