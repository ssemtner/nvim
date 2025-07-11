return {
  -- Autodetect tabstop and shiftwidth
  'tpope/vim-sleuth',

  'ntpeters/vim-better-whitespace',

  'ggml-org/llama.vim',

  -- {
  --   'rose-pine/neovim',
  --   name = 'rose-pine',
  --   priority = 1000,
  --   config = function()
  --     require('rose-pine').setup({
  --       -- variant = 'dawn',
  --       styles = {
  --         bold = true,
  --         italic = true,
  --         transparency = true,
  --       },
  --     })
  --     vim.cmd.colorscheme('rose-pine')
  --   end,
  -- },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        transparent_background = true,
      }
      vim.cmd.colorscheme("catppuccin")
    end,
  },

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
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VimEnter',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  }
}
