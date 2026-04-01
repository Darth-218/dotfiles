{
  description = "NixOS system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations.deathstar = lib.nixosSystem {
        modules = [
          ./nixos/base/default.nix
          ./nixos/features/keyboard.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
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