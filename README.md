# Currentyl Used Tools and Programs

- Nushell, Shell
- Neovim
- Wezterm, Terminal Emulator
- i3, Window Manager
- Polybar, Status Bar
- Kmonad
- Tmux
- Rofi
- sxhkd
- X11

# Nushell

```txt
── nushell
   ├── aliases.nu
   ├── config.nu
   ├── env.nu
   ├── history.txt
   ├── tmux.nu
   └── zoxide.nu
```

## Configuration (`config.nu`)

- Disabled start-up banner.
- Disabled case-sensitive completions.
- Set `vi` as the default mode.
- Changed the cursor shape.
- Set filesize units to metric.

```nu
$.env.config = {
    show_banner: false
    completions: {
        case_sensitive: false
    }
    edit_mode: vi
    cursor_shape: {
        emacs: line
        vi_insert: line
        vi_normal: block
    }
    filesize: {
        unit: "metric"
    }
}
```

## Scripts

- `tmux.nu` to launch tmux on starting the shell.
- `zoxide.nu` to set up `zoxide`.

# Neovim

# Colors

colors:
  red:
    rgb: [208, 66, 85]
    hex: "#d04255"
  orange:
    rgb: [213, 118, 63]
    hex: "#d5763f"
  yellow:
    rgb: [229, 181, 103]
    hex: "#e5b567"
  green:
    rgb: [168, 195, 115]
    hex: "#a8c373"
  cyan:
    rgb: [115, 187, 178]
    hex: "#73bbb2"
  blue:
    rgb: [108, 153, 187]
    hex: "#6c99bb"
  purple:
    rgb: [158, 134, 200]
    hex: "#9e86c8"
  pink:
    rgb: [176, 82, 121]
    hex: "#b05279"
