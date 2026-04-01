{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.packages = with pkgs; [
    cargo
    fd
    lua-language-server
    nil
    nixpkgs-fmt
    nodejs
    ripgrep
    texlive.combined.scheme-full
    tree-sitter
  ];

  home.file.".config/nvim" = {
    source = ./nvim;
    recursive = true;
  };
}