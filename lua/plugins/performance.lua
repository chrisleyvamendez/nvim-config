return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind-nvim", -- For icons in completion menu
      "tzachar/cmp-tabnine", -- TabNine completion engine
    },
    opts = {

      performance = {
        debounce = 60, -- debounce time for completion
        throttle = 30, -- throttle time for completion
        fetch = {
          enabled = true, -- enable fetching of completion items
          timeout = 1000, -- timeout for fetching completion items
        },
        async_budget = 1,
        max_view_items = 100, -- maximum number of items to show in the completion menu
      },
      window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
          scrollbar = false,
          col_offset = -3,
          side_padding = 0,
        },
        documentation = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
          max_height = math.floor(vim.o.lines * 0.4),
          max_width = math.floor(vim.o.columns * 0.6),
          scrollbar = false,
        },
      },
      formatting = {
        format = function(entry, vim_item)
          -- Customize the completion item formatting
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snip]",
            buffer = "[Buf]",
            path = "[Path]",
            cmp_tabnine = "[TN]",
          })[entry.source.name] or ""

          if string.len(vim_item.abbr) > 30 then
            vim_item.abbr = string.sub(vim_item.abbr, 1, 30) .. "..."
          end

          return vim_item
        end,
      },
      sources = {
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
        { name = "copilot", priority = 200 }, -- TabNine source
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true -- disable highlighting for large files
          end
          return false -- enable highlighting for other files
        end,
      },
    },
  },

  {
    "folke/trouble.nvim",
    cond = function()
      return vim.fn.line("$") < 5000
    end,
  },
}
