return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
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

  -- Renders LaTeX math

  {
    'jbyuki/nabla.nvim'
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

  -- Used to preview markdown files

  {

    "ellisonleao/glow.nvim",

    config = function()
      require('glow').setup({
	style = 'dark'
      })
    end
  },

}
