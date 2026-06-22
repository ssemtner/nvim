return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
  },
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = true,
      keymap = {
        accept = "<S-Tab>",
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
    nes = {
      enabled = false,
      auto_trigger = true,
      keymap = {
        accept_and_goto = "<C-[>",
        accept = false,
        dismiss = "<C-]>",
      },
    },
    panel = { enabled = false },
  },
  keys = {
    {
      "<leader>cpat",
      function()
        require("copilot.suggestion").toggle_auto_trigger()
      end,
      desc = "Toggle Copilot Auto Trigger",
    },
    {
      "<leader>cpd",
      "<cmd>Copilot disable<CR>",
      desc = "Disable Copilot",
    },
    {
      "<leader>cpe",
      "<cmd>Copilot enable<CR>",
      desc = "Enable Copilot",
    },
  },
}
