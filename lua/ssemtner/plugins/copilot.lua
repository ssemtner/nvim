return {
  'github/copilot.vim',
  config = function()
    vim.api.nvim_create_autocmd({'bufenter'}, {
      pattern = vim.fn.expand('~') .. '/developer/ucsd/cse12/*',
      command = 'Copilot disable',
    })
  end,
}
