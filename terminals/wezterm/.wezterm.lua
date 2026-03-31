local wezterm = require("wezterm")
local config = {}

config.enable_tab_bar = false

-- config.font = wezterm.font('Jetbrains Mono', { weight = "ExtraBold"})
config.font = wezterm.font_with_fallback {
  "Jetbrains Mono NF",
  "FiraCode Nerd Font",
}

config.font_size = 10.7

config.colors = {

  foreground = "#f0f0f0",
  background = "#000000",
  cursor_fg = "#000000",
  cursor_bg = "#cccccc",
  cursor_border = "#cccccc",
  selection_fg = "#262626",
  selection_bg = "#f0f0f0",

  ansi = {
    -- black
    "#000000",
    -- red
    "#d04255",
    -- green
    "#a8c373",
    -- yellow
    "#e5b567",
    -- blue
    "#6c99bb",
    -- magenta
    "#9e86c8",
    -- cyan
    "#73bbb2",
    -- white
    "#e7e7e7",
  },
  brights = {
    -- black
    "#4c4c4c",
    -- red
    "#d04255",
    -- green
    "#a8c373",
    -- yellow
    "#e5b567",
    -- blue
    "#6c99bb",
    -- magenta
    "#9e86c8",
    -- cyan
    "#73bbb2",
    -- white
    "#e7e7e7",
  }
}

return config
