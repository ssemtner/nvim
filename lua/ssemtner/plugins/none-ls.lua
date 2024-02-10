return {
  'nvimtools/none-ls.nvim',
  config = function()
    local null_ls = require('null-ls')
    local opts = {
      sources = {
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.djlint,
        null_ls.builtins.formatting.google_java_format.with({
          command = require('mason-registry').get_package('google-java-format-80'):get_install_path() .. '/google-java-format',
          args = {
            "-a",
            "-",
          }
        }),
      }
    }

    null_ls.setup(opts)
  end,
}
