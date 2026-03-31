{
  description = "NixOS system flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "path:/home/darth/.dotfiles/nixos/niri";
    };

    neovim = {
      url = "path:/home/darth/.dotfiles/nixos/neovim";
    };

    kmonad = {
      url = "path:/home/darth/.dotfiles/nixos/kmonad";
    };

    env = {
      url = "path:/home/darth/.dotfiles/nixos/env";
    };

    services = {
      url = "path:/home/darth/.dotfiles/nixos/services";
    };

    desktop = {
      url = "path:/home/darth/.dotfiles/nixos/desktop";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      niri,
      neovim,
      kmonad,
      env,
      services,
      desktop,
      ...
    }:
    {

      nixosConfigurations.deathstar = nixpkgs.lib.nixosSystem {

        modules = [
          ./configuration.nix

          kmonad.nixosModules.kmonad

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.darth = {
                imports = [
                  niri.homeManagerModules.niri
                  neovim.homeManagerModules.neovim
                  env.homeManagerModules.env
                  services.homeManagerModules.services
                  desktop.homeManagerModules.desktop
                  ./home.nix
                ];
              };
              backupFileExtension = "backup";
            };

          }
        ];
      };
    };
}
