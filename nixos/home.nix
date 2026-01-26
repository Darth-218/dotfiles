{ config, pkgs, lib, ... }:

let
	dotfiles = "${config.home.homeDirectory}/.dotfiles";
	create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
	configs = {
		nvim = "nvim/.config/nvim";
		niri = "niri/.config/niri";
		rofi = "rofi/.config/rofi";
		kmonad = "kmonad/.config/kmonad";
		ghostty = "ghostty/.config/ghostty";
		tmux = "tmux/.config/tmux";
		git = "git/.config/git";
	};
in

{
	imports = [
      ./modules/system.nix
	 		./modules/neovim.nix
	 		./modules/niri.nix
	 	];

	home.username = "darth";
	home.homeDirectory = "/home/darth";
	home.stateVersion = "25.11";

    programs.bash = {
      enable = true;
      shellAliases = {
        nixswitch = "sudo nixos-rebuild switch --flake ~/.dotfiles/nixos#deathstar";
        lg = "lazygit";
      };
    };

    xdg.configFile = builtins.mapAttrs (name: subpath: {
        source = create_symlink "${dotfiles}/${subpath}";
        recursive = true;
        }) configs;
  }
