require("ssemtner.options")
require("ssemtner.maps")
require("ssemtner.lazy")

vim.api.nvim_create_autocmd({
  "BufNewFile",
  "BufRead",
}, {
  pattern = "*.cl",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(buf, "filetype", "c")
  end,
})

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

-- typst image paste
local function paste_image_typst()
  local dir = vim.fn.expand("%:p:h")
  if dir == "" then
    vim.notify("file not saved", vim.log.levels.WARN)
    return
  end

  local num = 1
  while vim.fn.filereadable(dir .. "/image-" .. num .. ".png") == 1 do
    num = num + 1
  end

  local name = "image-" .. num .. ".png"
  local path = dir .. "/" .. name

  local cmd
  if vim.fn.has("mac") == 1 then
    cmd = string.format("pngpaste '%s'", path)
  else
    vim.notify("only works on mac for now", vim.log.levels.ERROR)
    return
  end

  local result = vim.fn.system(cmd)

  if vim.fn.filereadable(path) == 1 then
    local code = string.format("#image(\"%s\")", name)
    vim.api.nvim_put({ code }, "c", true, true)
  else
    vim.notify("failed to save image", vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "typst",
  callback = function()
    vim.keymap.set("n", "<leader>pp", paste_image_typst, {
      desc = "Paste image from clipboard (typst)",
      silent = true,
      buffer = true,
    })
  end,
})

-- modeline
-- vim: ts=2 sts=2 sw=2 et
