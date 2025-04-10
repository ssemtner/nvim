require('ssemtner.options')
require('ssemtner.maps')
require('ssemtner.lazy')

vim.api.nvim_create_autocmd(
  {
    "BufNewFile",
    "BufRead",
  },
  {
    pattern = "*.typ",
    callback = function()
      local buf = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_option(buf, "filetype", "typst")
    end
  }
)


vim.api.nvim_create_autocmd(
  {
    "BufNewFile",
    "BufRead",
  },
  {
    pattern = "*.cl",
    callback = function()
      local buf = vim.api.nvim_get_current_buf()
      vim.api.nvim_buf_set_option(buf, "filetype", "c")
    end
  }
)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})

-- modeline
-- vim: ts=2 sts=2 sw=2 et
