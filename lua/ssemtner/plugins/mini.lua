return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }

    require('mini.surround').setup()

    require('mini.notify').setup {
      window = {
        -- For transparency to work
        winblend = 0,
      }
    }


    local statusline = require 'mini.statusline'

    statusline.setup { use_icons = vim.g.have_nerd_font }
  end,
}
