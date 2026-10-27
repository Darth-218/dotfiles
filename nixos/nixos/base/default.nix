{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware.nix
    ./users.nix
    ./nvidia.nix
  ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings = {
      "port_mapping" = true;
    };
  };

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
  programs.nix-ld.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet";
        user = "darth";
      };
    };
  };

  services.tailscale = {
    enable = true;
  };

  services.openssh = {
    enable = true;
  };

  services.mysql = {
    enable = true;
    package = pkgs.mysql84;
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;

  nixpkgs.config.permittedInsecurePackages = [
    "openclaw-2026.4.12"
  ];

  environment.systemPackages = with pkgs; [
    home-manager
    vim
    wget
    git
    gnumake
    greetd
    tuigreet
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome
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
