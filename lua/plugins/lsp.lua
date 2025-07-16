return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = false, -- disable virtual text for diagnostics
      signs = true, -- enable signs for diagnostics
      underline = true, -- underline errors
    },
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
          },
        },
      },
    },
  },
  init = function()
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
      max_width = math.floor(vim.o.columns * 0.8),
      max_height = math.floor(vim.o.lines * 0.4),
      focusable = true,
      close_events = {
        "CursorMoved",
        "CursorMovedI",
        "InsertEnter",
        "FocusLost",
      },
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
      max_width = math.floor(vim.o.columns * 0.8),
      max_height = math.floor(vim.o.lines * 0.3),
      focusable = false,
      relative = "cursor",
    })
  end,
}
