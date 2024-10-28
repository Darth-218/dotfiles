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

-- Splitting windows --
--
-- Horizontally
vim.keymap.set("n", "<C-w>-", "<C-w>s", {noremap = true})
-- Vertically
vim.keymap.set("n", "<C-w>\\", "<C-w>v", {noremap = true})


-- Plugins --
--
-- Oil
vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", {noremap = true})

-- Telescope
vim.keymap.set("n", "<leader>F", "<cmd>cd %:h | Telescope find_files hidden=true<CR>", {noremap = true})
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files hidden=true<CR>", {noremap = true})
vim.keymap.set("n", "<leader>r", "<cmd>Telescope oldfiles<CR>", {noremap = true})
vim.keymap.set("n", "<leader>g", "<cmd>Telescope git_files<CR>", {noremap = true})
vim.keymap.set("n", "<leader>tl", "<cmd>Telescope live_grep<CR>", {noremap = true})
vim.keymap.set("n", "<leader>tb", "<cmd>Telescope buffers<CR>", {noremap = true})
vim.keymap.set("n", "<leader>tm", "<cmd>Telescope marks<CR>", {noremap = true})

-- Trouble
vim.keymap.set("n", "<leader>t", "<cmd>Trouble diagnostics<CR>", {noremap = true})

-- Dashboard
vim.keymap.set("n", "<leader>d", "<cmd>Dashboard<CR>", {noremap = true})

-- Undotree
vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle, {noremap = true})

-- bufferline
vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<leader>bk", "<cmd>BufferLinePickClose<CR>")

-- lspconfig
vim.keymap.set("n", "K", vim.lsp.buf.hover, {noremap = true})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {noremap = true})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {noremap = true})

-- NoNeckPain
vim.keymap.set("n", "<leader>wc", "<cmd>NoNeckPain<CR>", {noremap = true})

-- todo-comments
vim.keymap.set("n", "<leader>m", "<cmd>TodoTelescope cwd=%:h<CR>", {noremap = true})

-- hop
vim.keymap.set("n", "<leader>j", "<cmd>HopWord<CR>", {noremap = true})

-- Silicon
vim.keymap.set("n", "<C-s>", "<cmd>cd %:h | Silicon<CR>")

-- ZenMode
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>")

-- Glow (Makrdown preview)
vim.keymap.set("n", "<leader><C-g>", "<cmd>Glow<CR>")

-- Nabla (math preview)
vim.keymap.set("n", "<leader>l", "<cmd>lua require(\"nabla\").popup()<CR>")

-- Obsidian
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>")
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>")
