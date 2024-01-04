return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependancies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    -- Toggle previous and next buffers
    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

    -- Quick access to 1-4
    local function quickSelect(n)
      vim.keymap.set("n", "<leader>" .. n, function() harpoon:list():select(n) end)
    end

    quickSelect(1)
    quickSelect(2)
    quickSelect(3)
    quickSelect(4)
  end
}
