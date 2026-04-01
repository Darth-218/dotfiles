require "nvchad.options"

local o = vim.o
o.cursorlineopt = 'both'

vim.diagnostic.config({ virtual_text = false })
vim.wo.number = true
vim.wo.relativenumber = true
