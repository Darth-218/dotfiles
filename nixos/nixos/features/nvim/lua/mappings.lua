require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>m", "<cmd>set modifiable!<CR>", { noremap = true, desc = "Toggle modifiablity" })

map("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

-- In-file scrolling
map("n", "<C-d>", "<C-d>zz", { noremap = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true })

-- Copying to clipboard
map("v", "<leader>y", '"+y', { desc = "Copy selection to clipboard" })

-- Quick saving
map("n", "<leader>s", "<cmd>:w<CR>", { desc = "Save current buffer" })

-- Plugins --

-- Oil
map("n", "-", "<cmd>Oil --float<CR>", { noremap = true, desc = "Toggle Oil floating menu" })

-- Telescope
map("n", "<leader>f", "<cmd>Telescope find_files hidden=true<CR>", { noremap = true })
map("n", "<leader>l", "<cmd>Telescope live_grep<CR>", { noremap = true })
map("n", "<leader>b", "<cmd>Telescope buffers<CR>", { noremap = true })

-- Trouble
map("n", "<leader>t", "<cmd>Trouble diagnostics<CR>", { noremap = true })

-- lspconfig
map("n", "K", vim.lsp.buf.hover, { noremap = true, desc = "Show definition" })
map("n", "gd", vim.lsp.buf.definition, { noremap = true, desc = "Go to definition" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, desc = "Code actions" })

-- todo-comments
map("n", "<leader>co", "<cmd>TodoTelescope cwd=%:h<CR>", { noremap = true, desc = "Show todo comments" })

-- hop
map("n", "<leader>j", "<cmd>HopWord<CR>", { noremap = true, desc = "Hop to word" })

-- Silicon
map("n", "<C-s>", "<cmd>cd %:h | Silicon<CR>", { desc = "Take code snippet" })

-- NoNeckPain
map("n", "<leader>zn", "<cmd>NoNeckPain<CR>", { noremap = true, desc = "Toggle no neck pain" })

-- ZenMode
map("n", "<leader>zz", "<cmd>ZenMode<CR>", { noremap = true, desc = "Toggle zen mode" })

-- Nabla (math preview)
map("n", "<leader>n", "<cmd>lua require(\"nabla\").popup()<CR>", { desc = "Preview math" })

-- dap
map('n', '<F2>', function() require('dap').continue() end)
map('n', '<F3>', function() require('dap').step_into() end)
map('n', '<F4>', function() require('dap').step_over() end)
map('n', '<F5>', function() require('dap').step_out() end)
map('n', '<leader>db', function() require('dap').toggle_breakpoint() end)
