{
  description = "Kmonad keyboard configuration flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
  };

  outputs =
    { self
    , nixpkgs
    , ...
    }:
    {
      nixosModules.kmonad = import ./default.nix { inherit nixpkgs; };
    };
}
