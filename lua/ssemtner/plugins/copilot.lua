return {
  'github/copilot.vim',
  config = function()
    vim.api.nvim_create_autocmd({'BufEnter'}, {
      pattern = vim.fn.expand('~') .. '/Developer/ucsd/cse12/*',
      command = 'Copilot disable',
    })
  end,
}
