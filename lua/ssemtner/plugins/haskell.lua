return {
  'mrcjkb/haskell-tools.nvim',
  version = '^6',
  lazy = false,

  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  init = function()
    vim.g.haskell_tools = {}

    -- Set keymaps when entering Haskell buffers
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
      callback = function(ev)
        local ht = require('haskell-tools')
        local opts = { noremap = true, silent = true, buffer = ev.buf }

        vim.keymap.set('n', '<space>hcl', vim.lsp.codelens.run, opts)
        vim.keymap.set('n', '<space>hhs', ht.hoogle.hoogle_signature, opts)
        vim.keymap.set('n', '<space>hea', ht.lsp.buf_eval_all, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
      end
    })
  end
}
