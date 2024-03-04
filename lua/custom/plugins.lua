local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
      -- Go
      "gopls",
      -- Python
      "pyright",
      "black",
      "debugpy",
      "mypy",
      "ruff",
      },
    },
  },
{
  "neovim/nvim-lspconfig",
  config = function()
    require "plugins.configs.lspconfig"
    require "custom.configs.lspconfig"
  end,
},
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
}
return plugins
