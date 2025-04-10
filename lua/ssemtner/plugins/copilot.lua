return {
  'github/copilot.vim',
  config = function()
    vim.api.nvim_create_autocmd({ 'bufenter' }, {
      pattern = vim.fn.expand('~') .. '/developer/ucsd/cse[0-9]+?/*',
      command = 'Copilot disable',
    })
    vim.api.nvim_create_autocmd({ 'bufenter' }, {
      pattern = vim.fn.expand('~') .. '/developer/vh/*',
      command = 'Copilot disable',
    })
    vim.api.nvim_create_autocmd({ 'bufenter' }, {
      pattern = '*',
      command = 'Copilot disable',
    })
  end,
}
