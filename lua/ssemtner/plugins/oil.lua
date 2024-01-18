return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function(opts)
    require('oil').setup(opts);

    vim.keymap.set("n", "<leader>o", function() require('oil').toggle_float() end)
  end,
}
