-- [[ Non plugin keymaps go here ]]

-- Basic Keymaps
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- jk to exit input
vim.keymap.set('i', 'jk', '<Esc>', { silent = true })

-- Dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Format keybind
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({
    filter = function(client)
      -- Disable jdtls formattng because I am using null-ls with google-java-format for that
      return client.name ~= 'jdtls'
    end,
  })
end)

-- Save
vim.keymap.set("n", "<leader>w", function() vim.cmd("wa") end)

vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
