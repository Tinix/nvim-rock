local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general = augroup("General", { clear = true })

autocmd("TextYankPost", {
  group = general,
  pattern = "*",
  callback = function()
    vim.hl.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
  desc = "Highlight on yank",
})

autocmd("BufWritePre", {
  group = general,
  pattern = "*",
  command = ":%s/\\s\\+$//e",
  desc = "Remove trailing whitespace on save",
})

autocmd("BufEnter", {
  group = general,
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
  desc = "Don't auto comment new lines",
})

autocmd("BufReadPost", {
  group = general,
  pattern = "*",
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 1 and line <= vim.fn.line("$") and vim.bo.filetype ~= "commit" then
      vim.cmd('normal! g`"')
    end
  end,
  desc = "Restore cursor position",
})

autocmd("BufWritePre", {
  group = general,
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
  desc = "Auto create dir when saving a file",
})
