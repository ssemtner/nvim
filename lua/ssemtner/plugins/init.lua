return {
  -- Autodetect tabstop and shiftwidth
  'tpope/vim-sleuth',

  'ntpeters/vim-better-whitespace',

  'gleam-lang/gleam.vim',

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin-macchiato'
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
}
