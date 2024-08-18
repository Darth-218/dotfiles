return {

  "HiPhish/rainbow-delimiters.nvim",

  config = function()

  require("rainbow-delimiters.setup").setup({

      highlight = {

	'RainbowDelimiterBlue',
	'RainbowDelimiterOrange',
	'RainbowDelimiterGreen',
	'RainbowDelimiterViolet',
	'RainbowDelimiterCyan',
	'RainbowDelimiterYellow',
	'RainbowDelimiterRed',
      },})

    end,

}
