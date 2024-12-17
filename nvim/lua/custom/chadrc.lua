---@type ChadrcConfig
local M = {}

M.ui = { theme = 'gruvbox' }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

-- Set underline for indent-blankline context without changing text color
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#77bdfb" })
    vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", { fg = "#77bdfb", underline = true })
  end,
})

-- Filetype-specific settings for Perl
vim.api.nvim_create_augroup("filetype_specific", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "perl",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 3
    vim.opt_local.softtabstop = 3
  end,
  group = "filetype_specific",
})

return M

