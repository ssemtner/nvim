return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }

    require('mini.surround').setup()

    local statusline = require 'mini.statusline'

    statusline.setup { use_icons = vim.g.have_nerd_font }
  end,
}
