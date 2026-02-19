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

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    kmonad
    gnumake
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
