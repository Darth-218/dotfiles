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
    ripgrep
    fd
    lua-language-server
    nil
    nixpkgs-fmt
    nodejs
    tree-sitter
  ];

}
