require("options.lazy")
require("options.keymaps")
require("config.format")

vim.o.shiftwidth = 2

vim.g.copilot_enabled = 0

vim.opt.conceallevel = 1

vim.diagnostic.config({virtual_text = false})

vim.cmd.colorscheme("rose-pine")

vim.api.nvim_set_hl(0, "TelescopeNormal", {bg = "none"})
vim.api.nvim_set_hl(0, "TelescopeBorder", {bg = "none"})
vim.api.nvim_set_hl(0, "TelescopePromptNormal", {bg = "none"})
vim.api.nvim_set_hl(0, "TelescopePromptBorder", {bg = "none"})
vim.api.nvim_set_hl(0, "TelescopePromptTitle", {bg = "none"})
vim.api.nvim_set_hl(0, "TelescopeResultsNormal", {bg = "none"})
vim.api.nvim_set_hl(0, "TelescopeResultsBorder", {bg = "none"})
vim.api.nvim_set_hl(0, "TelescopeResultsTitle", {bg = "none"})
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", {bg = "none"})
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", {bg = "none"})
vim.api.nvim_set_hl(0, "TelescopePreviewTitle", {bg = "none"})
