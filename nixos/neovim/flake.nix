{
  description = "Neovim editor flake - editor config and dev tools";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
  };

  outputs =
    { self
    , nixpkgs
    , ...
    }:
    {
      homeManagerModules.neovim = import ./default.nix { inherit nixpkgs; };
    };
}
