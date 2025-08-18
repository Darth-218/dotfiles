-- Automatically ends certain structures
return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function() require("mason").setup() end
    }, {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "jdtls", "clangd", "omnisharp", "lua_ls", "gopls",
                    "pyright", "arduino_language_server"
                }
            })
        end
    }, {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.texlab.setup({})
            lspconfig.lua_ls.setup({})
            lspconfig.gopls.setup({})
            lspconfig.csharp_ls.setup({})
            lspconfig.pyright.setup({})
            lspconfig.jdtls.setup({})
            lspconfig.arduino_language_server.setup({})
            lspconfig.clangd.setup({
                filetypes = {"cpp", "c", "h", "tpp"},
                capabilities = capabilities,
                vim.filetype.add({extension = {tpp = "cpp"}})
            })
        end
    }, {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.clang_format
                },
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({
                            group = augroup,
                            buffer = bufnr
                        })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({buffer = bufnr})
                                -- vim.cmd("FormatLua")
                            end
                        })
                    end
                end
            })
        end
    }, {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy", -- Or `LspAttach`
        priority = 1000, -- needs to be loaded in first
        config = function()
            require('tiny-inline-diagnostic').setup({preset = "minimal"})
        end
    }, {"folke/trouble.nvim", dependencies = {"nvim-tree/nvim-web-devicons"}},
    {
        "lervag/vimtex",
        init = function()
            vim.g.vimtex_view_general_viewer = 'zathura'
            vim.g.vimtex_compiler_latexmk = {aux_dir = '.tex_aux/'}
        end
    }, {"mfussenegger/nvim-jdtls"}, {"kmonad/kmonad-vim"}, {"tpope/vim-endwise"}
}
