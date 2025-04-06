require("options.lazy")
require("options.keymaps")

vim.o.shiftwidth = 2

vim.diagnostic.config({ virtual_text = false })

vim.opt.conceallevel = 1

vim.cmd.colorscheme("mellifluous")
