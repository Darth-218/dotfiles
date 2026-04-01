{ lib, ... }:

{
  imports = [
    ../../base
  ];

  nixosConfigurations = {
    deathstar = lib.nixosSystem {
      modules = [
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.darth = import ../../../users/darth;
          };
        }
      ];
    };
  };
}