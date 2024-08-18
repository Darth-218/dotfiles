return {
  'ramojus/mellifluous.nvim',
  config = function()
    require'mellifluous'.setup({
      color_set = "mountain",
      mountain = {
	color_overrides = {
	  dark = {
	    -- bg = "#262626",
	  },
	},
      },
    })
  end,
}
