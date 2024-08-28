return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = true,
  opts = {
    open_mapping = [[<leader>tt]],
    insert_mappings = false,
    direction = 'float',
    highlights = require("rose-pine.plugins.toggleterm"),
  }
}
