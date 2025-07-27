-- vim.keymap.set("n", "<leader>b", "<cmd>Buffers<CR>", {noremap = true})

vim.keymap.set("n", "<leader>m", "<cmd>set modifiable!<CR>", {noremap = true})

vim.keymap.set("n", "H", "<cmd>bprev<CR>")
vim.keymap.set("n", "L", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>bdelete<CR>")

-- Pane navigation
vim.keymap.set("n", "<C-k>", "<C-w>k", {noremap = true})
vim.keymap.set("n", "<C-j>", "<C-w>j", {noremap = true})
vim.keymap.set("n", "<C-l>", "<C-w>l", {noremap = true})
vim.keymap.set("n", "<C-h>", "<C-w>h", {noremap = true})

-- In-file scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", {noremap = true})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {noremap = true})

-- Copying to clipboard
vim.keymap.set("v", "<leader>y", '"+y')

-- Quick saving
vim.keymap.set("n", "<leader>s", "<cmd>:w<CR>")

-- Plugins --

-- Oil
vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", {noremap = true})

-- Neotree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", {noremap = true})

-- Telescope
vim.keymap.set("n", "<leader>F", "<cmd>cd %:h | Telescope find_files hidden=true<CR>", {noremap = true})
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files hidden=true<CR>", {noremap = true})
vim.keymap.set("n", "<leader>r", "<cmd>Telescope oldfiles<CR>", {noremap = true})
vim.keymap.set("n", "<leader>g", "<cmd>Telescope git_files<CR>", {noremap = true})
vim.keymap.set("n", "<leader>l", "<cmd>Telescope live_grep<CR>", {noremap = true})
vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>", {noremap = true})
vim.keymap.set("n", "<leader>tm", "<cmd>Telescope marks<CR>", {noremap = true})

-- Trouble
vim.keymap.set("n", "<leader>t", "<cmd>Trouble diagnostics<CR>", {noremap = true})

-- lspconfig
vim.keymap.set("n", "K", vim.lsp.buf.hover, {noremap = true})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {noremap = true})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {noremap = true})

-- todo-comments
vim.keymap.set("n", "<leader>td", "<cmd>TodoTelescope cwd=%:h<CR>", {noremap = true})

-- hop
vim.keymap.set("n", "<leader>j", "<cmd>HopWord<CR>", {noremap = true})

-- Silicon
vim.keymap.set("n", "<C-s>", "<cmd>cd %:h | Silicon<CR>")

-- NoNeckPain
vim.keymap.set("n", "<leader>zn", "<cmd>NoNeckPain<CR>", {noremap = true})

-- ZenMode
vim.keymap.set("n", "<leader>zz", "<cmd>ZenMode<CR>")

-- Nabla (math preview)
vim.keymap.set("n", "<leader>n", "<cmd>lua require(\"nabla\").popup()<CR>")

-- Obsidian
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>")
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>")

-- dap
vim.keymap.set('n', '<F2>', function() require('dap').continue() end)
vim.keymap.set('n', '<F3>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F4>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F5>', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end)
