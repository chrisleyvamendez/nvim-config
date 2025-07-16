return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = {
          settings = {
            filetypes = { "terraform", "tf", "terraform-vars", "tfvars" },
            settings = {
              terraform = {
                validate = { enable = true },
              },
            },
          },
        },
      },
    },
  },
  -- treesitter for Terraform and HCL syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "terraform", "hcl" },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        ["terraform-vars"] = { "terraform_fmt" },
      },
    },
  },
  -- Terraform documentation
  {
    "ANGkeith/telescope-terraform-doc.nvim",

    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("terraform_doc")
    end,
  },
}
