-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.hidden = true -- Enable hidden buffers
vim.opt.history = 100 -- command history
vim.opt.updatetime = 700 -- update time for CursorHold events

vim.opt.swapfile = false -- disable swap files
vim.opt.backup = false

vim.opt.completeopt = "menu,menuone,noselect" -- completion options"
--scolling
vim.opt.scrolljump = 5
vim.opt.ttimeoutlen = 10 -- time to wait for a mapped sequence to complete

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.diagnostic.config({
  update_in_insert = false, -- don't update diagnostics while in insert mode
  virtual_text = false,
  signs = true,
  underline = true, -- underline errors
})
