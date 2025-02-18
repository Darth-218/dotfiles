require("options.lazy")
require("options.keymaps")

vim.o.shiftwidth = 2

vim.diagnostic.config({ virtual_text = false })

vim.opt.conceallevel = 3

vim.cmd.colorscheme("moonfly")
