{
  description = "Desktop applications flake - GUI apps, terminal, media players";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
  };

  outputs =
    { self
    , nixpkgs
    , ...
    }:
    {
      homeManagerModules.desktop = import ./default.nix { inherit nixpkgs; };
    };
}
