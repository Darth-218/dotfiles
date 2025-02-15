return {

  'nvim-lualine/lualine.nvim',

  dependencies = { 'nvim-tree/nvim-web-devicons' },

  opts = {
    options = {
      icons_enabled = false,
      -- theme = 'onedark',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
	statusline = {},
	winbar = {},
      },
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
    sections = {
      lualine_a = {'location'},
      lualine_b = {'filename'},
      lualine_c = {''},
      lualine_x = {''},
      lualine_y = {''},
      lualine_z = {''}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
  extensions = {},
  },
}
