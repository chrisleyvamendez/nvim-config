-- ~/.config/nvim/lua/config/highlights.lua
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Completion menu styling
    vim.api.nvim_set_hl(0, "CmpPmenu", {
      bg = "#1e1e2e",
      fg = "#cdd6f4",
      blend = 10,
    })

    vim.api.nvim_set_hl(0, "CmpBorder", {
      bg = "#1e1e2e",
      fg = "#89b4fa",
    })

    -- Selected item
    vim.api.nvim_set_hl(0, "PmenuSel", {
      bg = "#45475a",
      fg = "#cdd6f4",
      bold = true,
    })

    -- Documentation window
    vim.api.nvim_set_hl(0, "CmpDoc", {
      bg = "#181825",
      fg = "#cdd6f4",
    })

    vim.api.nvim_set_hl(0, "CmpDocBorder", {
      bg = "#181825",
      fg = "#89b4fa",
    })

    -- Custom kind highlights
    vim.api.nvim_set_hl(0, "CmpItemKindModule", {
      fg = "#f9e2af",
      bg = "#1e1e2e",
    })

    vim.api.nvim_set_hl(0, "CmpItemKindFunction", {
      fg = "#94e2d5",
      bg = "#1e1e2e",
    })

    vim.api.nvim_set_hl(0, "CmpItemKindReference", {
      fg = "#f5c2e7",
      bg = "#1e1e2e",
    })
  end,
})
