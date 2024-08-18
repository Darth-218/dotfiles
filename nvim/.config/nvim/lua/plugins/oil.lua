return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    autosave_changes = true,
    default_file = true,
    columns = { "icon", "permissions", "size" },
    keymaps = {
      ["H"] = "actions.parent",
      ["L"] = "actions.select",
      ["q"] = "actions.close",
      ["<Esc>"] = "actions.close",
    },
    view_options = {
      show_hidden = true,
    },
    float = {
      padding = 5,
      max_height = 25,
      max_width = 80,
      win_options = {
	winblend = 5,
      },
    },
  },
}
