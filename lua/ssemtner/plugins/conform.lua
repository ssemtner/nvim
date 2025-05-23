return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat'
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = false,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      rust = { 'rustfmt' },
      go = { 'gofmt' },
      c = { 'clang_format' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
      json = { 'prettier' },
      nix = { 'alejandra' },
      systemverilog = { 'verible' },
      typst = {'typstyle'},
    },
    formatters = {
      clang_format = {
        prepend_args = { '--style=file', '--fallback-style=LLVM' },
      }
    }
  }
}
