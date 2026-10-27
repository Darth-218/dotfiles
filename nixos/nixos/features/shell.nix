{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    tmux
    zoxide
    fzf
    ffmpeg
    glow
    btop
    gcc
    go
    gh
    python315
    sesh
    unzip
    podman-compose
    lazygit
    nerd-fonts.jetbrains-mono
    mysql84
    nodejs_24
    ninja
    meson
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Yahia Gaber";
        email = "yahia.hany.gaber@proton.me";
      };

      extraConfig = {
        credential.helper = "store";
        push.default = "current";
        pull.rebase = true;
        rebase.autoStash = true;
        status.branch = true;
        status.showStash = true;
        status.showUntrackedFiles = "all";
        advice.statusHints = false;
        core.whitespace = "error";
        interactive.editor = "nvim";
        interactive.singleKey = true;
      };
    };
  };

  home.file = {
    ".bashrc".source = ./bashrc/.bashrc;
    ".config/tmux".source = ./tmux;
  };
}
