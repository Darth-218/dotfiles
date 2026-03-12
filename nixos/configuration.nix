{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./users.nix
    ./services.nix
    ./nvidia.nix
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
