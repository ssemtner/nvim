return {
  -- Autodetect tabstop and shiftwidth
  'tpope/vim-sleuth',

  'ntpeters/vim-better-whitespace',

  'gleam-lang/gleam.vim',

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
      require('rose-pine').setup({
        variant = 'main',
        styles = {
          bold = true,
          italic = true,
          transparency = true,
        },
      })
      vim.cmd.colorscheme 'rose-pine'
    end,
  },

  -- Lualine
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_x = { 'overseer' },
      },
    },
  },

  -- This errors for some reason
  -- Indentation guides on blank lines
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    config = function()
      require('ibl').setup()
    end,
  },

  -- Use gc to coment visual selections
  { 'numToStr/Comment.nvim', opts = {} },

  -- Wakatime
  { 'wakatime/vim-wakatime' },

  -- Preview colors
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      filetypes = {
        'css',
        'scss',
        'javascript',
        'html',
      }
    }
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  }
}
