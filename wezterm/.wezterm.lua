local wezterm = require("wezterm")
local config = {}

config.enable_tab_bar = false

-- config.font = wezterm.font('Jetbrains Mono', { weight = "ExtraBold"})
config.font = wezterm.font_with_fallback {
  "Jetbrains Mono NF ExtraBold",
  "FiraCode Nerd Font SemBd",
}

config.colors = {
  foreground = "#f0f0f0",
  background = "#000000",
  cursor_fg = "#000000",
  cursor_bg = "#cccccc",
  cursor_border = "#cccccc",
  selection_fg = "#262626",
  selection_bg = "#f0f0f0",

  ansi = {
    "#262626",
    "#ac8a8c",
    "#8aac8b",
    "#aca98a",
    "#8f8aac",
    "#ac8aac",
    "#8aacab",
    "#e7e7e7",
  },
  brights = {
    -- black
    "#4c4c4c",
    -- red
    "#c49ea0",
    -- green
    "#9ec49f",
    -- yellow
    "#c4c19e",
    -- blue
    "#a39ec4",
    -- magenta
    "#c49ec4",
    -- cyan
    "#9ec3c4",
    -- white
    "#f0f0f0",
  }
}

return config
