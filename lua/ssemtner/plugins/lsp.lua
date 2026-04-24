return {
  {
    "neovim/nvim-lspconfig",
    branch = "master",
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:ssemtner/mason-registry",
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
      "williamboman/mason-lspconfig.nvim",
      { "j-hui/fidget.nvim", opts = {} },
      { "folke/lazydev.nvim", ft = "lua", opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local bufnr = args.buf

          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
          end

          map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
          map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

          -- map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          -- map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          -- map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          -- map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          -- map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          -- map('<leader>ws', require('telescope.builtin').lsp_workspace_symbols, '[W]orkspace [S]ymbols')

          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
          -- map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          if client.name == "clangd" then
            map("<leader>H", "<cmd>LspClangdSwitchSourceHeader<cr>", "Switch Source/[H]eader")
          end
        end,
      })

      local servers = {
        clangd = {
          cmd = {
            "clangd",
            "--offset-encoding=utf-16",
            "--query-driver=/nix/store/*/bin/clang,/nix/store/*/bin/clang++",
          },
        },
        gopls = {},
        basedpyright = {},
        rust_analyzer = {},
        html = {},
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
      }

      local capabilities = require("blink.cmp").get_lsp_capabilities()

      for name, config in pairs(servers) do
        config.capabilities = capabilities
        vim.lsp.config(name, config)
      end

      vim.lsp.enable(vim.tbl_keys(servers))

      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(servers),
      })
    end,
  },
}
