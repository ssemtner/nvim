return {
  'github/copilot.vim',
  config = function()
    vim.api.nvim_create_autocmd({'BufEnter'}, {
      pattern = "*",
      command = 'Copilot disable',
    })
    vim.api.nvim_create_autocmd({'bufenter'}, {
      pattern = vim.fn.expand('~') .. '/.config/nvim/*',
      command = 'Copilot enable',
    })
  end,
}
