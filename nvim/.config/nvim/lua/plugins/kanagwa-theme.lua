return {
	"rebelot/kanagawa.nvim",

	config = function(plugin)
		vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
		vim.cmd([[colorscheme kanagawa-dragon]])
		vim.api.nvim_set_hl(0, "LineNrAbove", {fg="#d9a594", bold = false})
		vim.api.nvim_set_hl(0, "LineNr", {fg="#FF9E3B", bold = true})
		vim.api.nvim_set_hl(0, "LineNrBelow", {fg="#d9a594", bold = false})
		vim.wo.relativenumber = true
	end,

}
