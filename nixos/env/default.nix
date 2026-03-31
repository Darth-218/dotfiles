{ nixpkgs }:

{
  config,
  pkgs,
  lib,
  ...
}:

{
  programs.bash = {
    enable = true;
    initExtra = ''
      # Load bashrc
      if [ -f ~/.config/bashrc/bashrc ]; then
        source ~/.config/bashrc/bashrc
      fi
    '';
  };

  home.packages = with pkgs; [
    tmux
    zoxide
    fzf
    glow
    btop
    gcc
    go
    gh
    python315
    lazygit
    nerd-fonts.jetbrains-mono
    mysql84
    mysql-workbench
  ];

  xdg.configFile = {
    "tmux".source = ./config/tmux;
    "bashrc".source = ./config/bashrc;
  };
}
