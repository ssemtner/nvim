return {
  -- Autodetect tabstop and shiftwidth
  'tpope/vim-sleuth',

  'ntpeters/vim-better-whitespace',

  'ggml-org/llama.vim',

  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
      -- include a picker of your choice, see picker section for more details
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require('leetcode').setup()

      vim.keymap.set("n", "<leader>lcl", ":Leet list<CR>", { desc = "Leetcode list" })
      vim.keymap.set("n", "<leader>lcr", ":Leet run<CR>", { desc = "Leetcode run" })
      vim.keymap.set("n", "<leader>lcs", ":Leet submit<CR>", { desc = "Leetcode submit" })
      vim.keymap.set("n", "<leader>lcc", ":Leet console<CR>", { desc = "Leetcode console" })
      vim.keymap.set("n", "<leader>lch", ":Leet hints<CR>", { desc = "Leetcode hints" })
      vim.keymap.set("n", "<leader>lcL", ":Leet lang<CR>", { desc = "Leetcode lang" })
    end
  },

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
