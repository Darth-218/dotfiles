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
    fzf
    lua-language-server
    nil
    nixpkgs-fmt
    nodejs
  ];

}
