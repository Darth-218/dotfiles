{
  config,
  pkgs,
  lib,
  ...
}:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    ghostty = "ghostty/.config/ghostty";
    git = "git/.config/git";
    kmonad = "kmonad/.config/kmonad";
    mako = "mako/.config/mako";
    niri = "niri/.config/niri";
    nvim = "nvim/.config/nvim";
    rofi = "rofi/.config/rofi";
    tmux = "tmux/.config/tmux";
    zathura = "zathura/.config/zathura";
  };
in

{
  imports = [
    ./modules/neovim.nix
    ./modules/niri.nix
    ./modules/system.nix
    ./modules/virtualization.nix
  ];

  home.username = "darth";
  home.homeDirectory = "/home/darth";
  home.stateVersion = "25.11";

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;
}
