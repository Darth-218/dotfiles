return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Makes markdown files look good inside buffers
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      markdown = {
        enable = false
      },
      markdown_inline = {
        enable = false
      }
    }
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      checkbox = {
        enabled = true,
        render_modes = false,
        position = 'overlay',
        unchecked = {
          icon = '󰄱 ',
          highlight = 'RenderMarkdownUnchecked',
          scope_highlight = nil,
        },
        checked = {
          icon = '󰱒 ',
          highlight = 'RenderMarkdownChecked',
          scope_highlight = nil,
        },
        custom = {
          todo = { raw = '[-]', rendered = ' ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
          doing = { raw = '[/]', rendered = '󰥔 ', highlight = 'RenderMarkdownInProg', scope_highlight = nil },
        },
      },
    },
  },

  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown",
    config = function()
      require('markdown').setup({
      })
    end
  },

  {
    "dhruvasagar/vim-table-mode"
  },

  {
    "bullets-vim/bullets.vim"
  }
}
