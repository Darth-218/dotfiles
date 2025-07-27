# Currentyl Used Tools and Programs

- zsh, Shell
- Neovim, Text Editor
- Ghostty, Terminal Emulator
- hyprland, Window Manager
- Waybar, Status Bar
- Kmonad
- Tmux, Terminal Session Manager
- Rofi, App Launcher
- Wayland

# Alacritty

| Variable               | Value                              | Description                                   |
|------------------------|------------------------------------|-----------------------------------------------|
| shell                  | "/bin/zsh"                         | The default terminal shell                    |
| font.normal.family     | "JetbrainsMono NFM ExtraBold"      | Set the font to JetbrainsMono                 |
| font.normal.style      | "SemiBold"                         | Set the font weight to semi-bold              |
| font.offset.y          | 3                                  | Increasing the vertical spacing between lines |
| font.size              | 8                                  | Decreased the font size                       |
| window.padding         | {x = 10, y = 5}                    | Padding between text and window border        |
| window.dimensions      | {columns = 209, lines = 44}        | Window size                                   |
| cursor.style           | {shape = "block", blinking = "on"} | Setting cursor shape to block                 |
| mouse.hide_when_typing | true                               |                                               |

# Dunst

| Variable                  | Value                      | Description                             |
|---------------------------|----------------------------|-----------------------------------------|
| global.notification_limit | 5                          | Set the limit to not clutter the screen |
| global.font               | JetbrainsMono Nerd Font 11 | Set the font to JetbrainsMono           |
| global.format             | "\<b\>%s\</b\>\n%b"        | Message format                          |

# DWM

```
── dwm
    ├── cmds.h
    ├── colors.h
    ├── config.h
    └── keychords.h
```

## `cmds.h`

```c
// default terminal
static const char *termcmd[] = {"ghostty", NULL};

// Default internet browser
static const char *browsercmd[] = {"librewolf", NULL};

// Default file browser
static const char *filescmd[] = {"dolphin", NULL};

// Restart slstatus
static const char *restartbar[] = {"pkill slstatus; slstatus &", NULL};
```

## `colors.h`

| Color          | Value     |
|----------------|-----------|
| `col_gray1`    | "#181616" |
| `col_gray2`    | "#444444" |
| `col_gray3`    | "#282727" |
| `col_gray4`    | "#eeeeee" |
| `col_gray5`    | "#0f0f0f" |
| `col_red`      | "#e46876" |
| `col_softred`  | "#ebbcba" |
| `col_gold`     | "#c0a36e" |
| `col_white`    | "#ffffff" |
| `col_pink`     | "#b29d9b" |
| `col_orange`   | "#FF9E3B" |
| `col_blue`     | "#768a84" |
| `col_blue2`    | "#181926" |
| `col_cyan`     | "#2c7e9b" |
| `col_darkblue` | "#0D0C16" |
| `col_green`    | "#8aac8b" |
| `col_black`    | "#000000" |
| `col_purple`    | "#8f8aac" |

## `config.h`

*I don't remember which patches I have applied* :(

| Variable        | Value                  | Description                           |
|-----------------|------------------------|---------------------------------------|
| `borderpx`      | 3                      | Window border size                    |
| `startwithgaps` | 1                      | Start with gaps... duh                |
| `gappx`         | 5                      | Gaps between windows                  |
| `showbar`       | 1                      |                                       |
| `topbar`        | 1                      |                                       |
| `horizpadbar`   | 4                      | Horizontal statusbar padding (inside) |
| `vertpadbar`    | 4                      | Vertical statusbar padding (inside)   |
| `fonts`         | "JetbrainsMono:size=7" | Default WM font                       |
| `mfact`         | 0.5                    | Default master window width           |

## `keychords.h`

| Key combo                    | Action                             |
|------------------------------|------------------------------------|
| Super + Shift + Return       | Launch terminal                    |
| Super + N, Super + N         | Launch terminal                    |
| Super + B                    | Toggle slstatus                    |
| Super + Ctrl + Shift + B     | Restart slstatus                   |
| Super + J                    | Cycle to the next window           |
| Super + K                    | Cycle to the previous window       |
| Super + I                    | Increase no. of master windows     |
| Super + D                    | Decrease no. of master windows     |
| Super + L                    | Increase master window width       |
| Super + H                    | Decrease master window width       |
| Super + Return               | Set current window to master       |
| Super + Tab                  | Switch to last used tag            |
| Super + Shift + J            | Move window down                   |
| Super + Shift + K            | Move window up                     |
| Super + Shift + X            | Close current window               |
| Super + T                    | Toggle tiled layout                |
| Super + F                    | Toggle floating layout             |
| Super + M                    | Toggle monocole layout             |
| Super + Shift + Space        | Float current window               |
| Super + 0                    | Toggle all tags                    |
| Super + Ctrl + J             | Move focus to the next screen      |
| Super + Ctrl + K             | Move focus to the previous screen  |
| Super + Shift + Period       | Move window to the next screen     |
| Super + Shift + Comma        | Move window to the previous screen |
| Super + Ctrl + Shift + Equal | Toggle gaps                        |
| Super + Ctrl + Shift + Minus | Reset gap size                     |
| Super + Ctrl + Equal         | Increase gap size                  |
| Super + Ctrl + Minus         | Decrease gap size                  |
| Super + Shift + Q            | Log out of DWM                     |
| Super + Shift + R            | Restart DWM                        |
| Super + \[1...0\]            | Switch to tag                      |

# EWW

*Work in Progress*

# Ghostty

| Variable             | Value         | Description          |
|----------------------|---------------|----------------------|
| `gtk-titlebar`       | false         | Disable title bar    |
| `title`              | Ghostty       | Setting window title |
| `font-size`          | 11            |                      |
| `font-family`        | JetbrainsMono |                      |
| background           | #000000       |                      |
| foreground           | #f0f0f0       |                      |
| selection-foreground | #262626       |                      |
| selection-background | #f0f0f0       |                      |
| background-opacity   | 0.9           |                      |
| background-blur      | 50            |                      |

# Git

# Hyprland

# i3

# Katana

# Kanshi

# Kitty

# Kmonad

# Nushell

```
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

# Oh-My-Posh

# Polybar

# Rofi

# Slstatus

# sxhkd

# Tmux

# Vimium

# Waybar

# Wezterm

# Xinitrc

# Zshrc

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
