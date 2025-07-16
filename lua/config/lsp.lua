vim.lsp.set_log_level("ERROR")
vim.diagnostic.config({
  update_in_insert = false,
  virtual_test = false,
  signs = true,
  underline = true,
})

vim.opt.updatetime = 100
vim.opt.timeoutlen = 300
