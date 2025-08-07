require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)


local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

-- GOPLS
lspconfig.gopls.setup {
  on_attach=on_attach,
  capabilities=capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings={
    gopls={
      -- hints = {
      --   parameterNames = true,
      -- },
codelenses = {
								gc_details = false,
								generate = true,
								regenerate_cgo = true,
								run_govulncheck = true,
								test = true,
								tidy = true,
								upgrade_dependency = true,
								vendor = true,
							},
      completeUnimported=true,
      usePlaceholders=true,
      analyses={
        unusedparams=true
      }
    }
  }
}

-- PYRIGHT
lspconfig.pyright.setup {
  filetypes = {"python"},
  on_attach = on_attach,
  capabilities = capabilities,
}

-- RUFF LSP
lspconfig.ruff.setup {
  filetypes = {"python"},
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    settings = {
      args = {},
    }
  }
}
-- read :h vim.lsp.config for changing options of lsp servers 
