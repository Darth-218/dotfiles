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

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 3;

  systemd.services.boot-cleanup = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = pkgs.writeShellScript "boot-cleanup" ''
        set -e
        cd /boot/EFI/nixos || exit 0
        for f in *-initrd*.efi; do
          [ -f "$f" ] || continue
          rm -f "$f"
        done
        for f in *.tmp; do
          [ -f "$f" ] || continue
          rm -f "$f"
        done
      '';
    };
  };

  networking.hostName = "deathstar";
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;

  time.timeZone = "Africa/Cairo";

  programs.niri.enable = true;
  programs.xwayland.enable = true;
  programs.firefox.enable = true;

  virtualisation.libvirtd.enable = lib.mkForce false;
  virtualisation.waydroid.enable = lib.mkForce false;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.nvidia.acceptLicense = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    gnumake
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