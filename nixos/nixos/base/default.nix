{
  config,
  lib,
  pkgs,
  zen-browser,
  ...
}:

{
  imports = [
    ./hardware.nix
    ./users.nix
    ./nvidia.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  networking.hostName = "deathstar";
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;

  time.timeZone = "Africa/Cairo";

  programs.niri.enable = true;
  programs.xwayland.enable = true;
  programs.firefox.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet";
        user = "darth";
      };
    };
  };

  virtualisation.libvirtd.enable = lib.mkForce false;
  virtualisation.waydroid.enable = lib.mkForce false;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    gnumake
    greetd
    tuigreet
    zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      max-jobs = 2;
    };
  };

  system.stateVersion = "25.11";
}