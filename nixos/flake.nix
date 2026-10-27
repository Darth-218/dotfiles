{
  description = "NixOS system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pi-mono.url = "github:lukasl-dev/pi-mono.nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      zen-browser,
      pi-mono,
      ...
    }:
    let
      lib = nixpkgs.lib;
      unstable-pkgs = import nixpkgs-unstable {
        system = "x86_64-linux";
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [
            "openclaw-2026.4.12"
            "ciscoPacketTracer8-8.2.2"
          ];
        };
      };
    in
    {
      nixosConfigurations.deathstar = lib.nixosSystem {
        specialArgs = {
          inherit zen-browser pi-mono;
          unstable = unstable-pkgs;
        };
        modules = [
          ./nixos/base/default.nix
          ./nixos/features/keyboard.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit zen-browser pi-mono;
                unstable = unstable-pkgs;
              };
              users.darth = {
                imports = [
                  ./nixos/features/shell.nix
                  ./nixos/features/editor.nix
                  ./nixos/features/desktop.nix
                  ./nixos/features/wm.nix
                  ./nixos/features/services.nix
                ];
                home.stateVersion = "25.11";
                home.username = "darth";
                home.homeDirectory = "/home/darth";
              };
            };
          }
        ];
      };
    };
}
