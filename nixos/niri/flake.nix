{
  description = "Niri desktop environment flake - wm, terminal, apps";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
  };

  outputs =
    { self
    , nixpkgs
    , ...
    }:
    {
      homeManagerModules.niri = import ./default.nix { inherit nixpkgs; };
    };
}
