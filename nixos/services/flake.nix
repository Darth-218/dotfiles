{
  description = "Network and sync services flake - tailscale, syncthing, wifi tools";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
  };

  outputs =
    { self
    , nixpkgs
    , ...
    }:
    {
      homeManagerModules.services = import ./default.nix { inherit nixpkgs; };
    };
}
