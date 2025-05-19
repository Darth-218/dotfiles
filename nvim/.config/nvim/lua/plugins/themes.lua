return {
  {
    'astridlyre/moonlight.nvim'
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
      transparent_background = true,
      integrations = {
	telescope = {
	  enabled = true,
	  style = "nvchad" -- or "classic", try both
	},
	-- enable others if needed
      }
    })
      end,
  },

  {
    'projekt0n/github-nvim-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
	-- ...
      })

      vim.cmd('colorscheme github_dark')
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000 ,
    config = true,
    opts = ...
  },

  {
    "rebelot/kanagawa.nvim",

    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      vim.cmd([[colorscheme kanagawa-dragon]])
      vim.api.nvim_set_hl(0, "LineNrAbove", {fg="#d9a594", bold = false})
      vim.api.nvim_set_hl(0, "LineNr", {fg="#FF9E3B", bold = true})
      vim.api.nvim_set_hl(0, "LineNrBelow", {fg="#d9a594", bold = false})
      vim.wo.relativenumber = true
    end,

  },

  {
    "marko-cerovac/material.nvim",

    -- require("material").setup({
    --   custom_colors = function(colors)
    --     colors.editor.bg = "#1e1d2f"
    --   end,
    -- })
  },

  {
    "savq/melange-nvim" 
  },

  {
    'ramojus/mellifluous.nvim',
    config = function()
      require'mellifluous'.setup({
	color_set = "mountain",
	mountain = {
	  color_overrides = {
	    dark = {
	      -- bg = "#262626",
	    },
	  },
	},
      })
    end,
  },

  {

    "bluz71/vim-moonfly-colors",

    name = "moonfly",
    lazy = false,
    priority = 1000,

    config = function()

      vim.api.nvim_set_hl(0, "LineNr", {fg="#80A0FF", bold = true})
      vim.g.moonflyItalics = true

    end
  },

  {
    "shaunsingh/moonlight.nvim",
    config = function()
      require('moonlight').set({
	options = {
	  moonlight_italic_comments = true,
	  moonlight_italic_keywords = true,
	  moonlight_disable_background = false,
	}
      })
    end
  },

  {
    "aktersnurra/no-clown-fiesta.nvim"
  },

  {
    "rose-pine/neovim",
    name = "rose-pine"
  },

  {
    "tiagovla/tokyodark.nvim",
    opts = {
      -- custom options here
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
      vim.cmd [[colorscheme tokyodark]]
    end,
  },

  {
    'Everblush/nvim'
  },

  {
    "rjshkhr/shadow.nvim",
    priority = 1000,
    config = function()
        vim.opt.termguicolors = true
        vim.cmd.colorscheme("shadow")
    end,
  },

  {
    "oxfist/night-owl.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      require("night-owl").setup()
      vim.cmd.colorscheme("night-owl")
      vim.api.nvim_set_hl(0, "LineNrAbove", {fg="#d9a594", bold = false})
      vim.api.nvim_set_hl(0, "LineNr", {fg="#FF9E3B", bold = true})
      vim.api.nvim_set_hl(0, "LineNrBelow", {fg="#d9a594", bold = false})
      vim.wo.relativenumber = true
    end,
  }
}
