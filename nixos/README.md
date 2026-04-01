# NixOS Configuration

This is my NixOS system configuration, restructured from multiple separate flakes to a single unified flake using the [flake-parts](https://flake.parts) pattern inspired by [vimjoyer/nixconf](https://github.com/vimjoyer/nixconf).

## Structure

```
nixos/
├── flake.nix              # Main flake using flake-parts
├── nixos/
│   ├── base/             # Core system config
│   │   ├── default.nix   # Main system options
│   │   ├── hardware.nix  # Hardware config
│   │   ├── users.nix    # User definitions
│   │   └── nvidia.nix   # NVIDIA driver config
│   ├── features/         # Feature modules (configs bundled here)
│   │   ├── shell.nix    # bash, tmux, zoxide, dev tools
│   │   ├── editor.nix   # neovim, git, dev packages
│   │   ├── desktop.nix  # ghostty, rofi, mako, apps
│   │   ├── wm.nix       # niri window manager
│   │   ├── services.nix  # tailscale, syncthing
│   │   └── keyboard.nix # kmonad keyboard config
│   └── hosts/
│       └── deathstar.nix # Machine-specific config
└── users/
    └── darth/
        └── default.nix   # Home-manager user config
```

## Feature Modules

| Module | Description |
|--------|-------------|
| `shell.nix` | bash, tmux, zoxide, fzf, glow, btop, gcc, go, python, mysql |
| `editor.nix` | neovim, git, cargo, lua-language-server, nodejs, tree-sitter |
| `desktop.nix` | ghostty, rofi, mako, mpv, vlc, zathura, libreoffice, etc. |
| `wm.nix` | niri window manager configuration |
| `services.nix` | tailscale, syncthing, linux-wifi-hotspot, wiremix |
| `keyboard.nix` | kmonad keyboard mapping |

## Config Locations

Configs are **bundled** with their feature modules (matching vimjoyer's pattern):

- `nixos/features/nvim/` → neovim config
- `nixos/features/wm/niri/` → niri config
- `nixos/features/tmux/` → tmux config
- `nixos/features/bashrc/` → bashrc
- `nixos/features/ghostty/`, `rofi/`, `mako/`, etc. → desktop apps

## Usage

```bash
# Build and switch
sudo nixos-rebuild switch --flake /path/to/nixos#deathstar

# Or use the alias (defined in bashrc)
nsw
```

## History

This configuration was restructured from 6 separate flakes into a single unified flake:

- **Old**: niri/, neovim/, kmonad/, env/, services/, desktop/ (each a separate flake)

## Key Changes

1. Used `flake-parts` for automatic module imports
2. Bundled configs with their modules (no separate config directories)
3. Single flake instead of multiple flake repos
4. Configs in `nixos/features/` instead of separate repos
