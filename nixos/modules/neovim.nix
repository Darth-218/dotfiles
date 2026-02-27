{
  config,
  pkgs,
  lib,
  ...
}:

{
  # description = "Neovim";

  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  home.packages = with pkgs; [
    cargo
    fd
    lua-language-server
    nil
    nixpkgs-fmt
    nodejs
    ripgrep
    tree-sitter
  ];

}
