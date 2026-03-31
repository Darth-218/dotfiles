{
  description = "Shell environment flake - tmux, zoxide, fzf, glow, btop, dev tools";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
  };

  outputs =
    { self
    , nixpkgs
    , ...
    }:
    {
      homeManagerModules.env = import ./default.nix { inherit nixpkgs; };
    };
}
