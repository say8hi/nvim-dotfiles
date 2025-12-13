-- LSP capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- enhanced capabilities with folding support
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- disable semanticTokens for better performance
local function on_init(client, _)
  if client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

-- custom on_attach with nvim-navic integration
local function on_attach(client, bufnr)
  -- attach nvim-navic if available
  local navic_ok, navic = pcall(require, "nvim-navic")
  if navic_ok and client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  -- enable inlay hints if supported
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end

-- diagnostic signs
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local lspconfig = require "lspconfig"

-- GOPLS
lspconfig.gopls.setup {
  capabilities = capabilities,
  on_init = on_init,
  on_attach = on_attach,
  settings = {
    gopls = {
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
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
      gofumpt = true,
      analyses = {
        unusedparams = true,
        shadow = true,
        nilness = true,
        unusedwrite = true,
      }
    }
  }
}

-- RUFF LSP
lspconfig.ruff.setup {
  capabilities = capabilities,
  on_init = on_init,
  on_attach = on_attach,
}

-- PYRIGHT
lspconfig.pyright.setup {
  capabilities = capabilities,
  on_init = on_init,
  on_attach = on_attach,
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
        typeCheckingMode = "basic",
      },
    },
  },
}

-- JSON
lspconfig.jsonls.setup {
  capabilities = capabilities,
  on_init = on_init,
  on_attach = on_attach,
}

-- TypeScript/JavaScript
lspconfig.ts_ls.setup {
  capabilities = capabilities,
  on_init = on_init,
  on_attach = on_attach,
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
}

-- HTML
lspconfig.html.setup {
  capabilities = capabilities,
  on_init = on_init,
  on_attach = on_attach,
}

-- CSS
lspconfig.cssls.setup {
  capabilities = capabilities,
  on_init = on_init,
  on_attach = on_attach,
}

-- SQL
-- sqls is not installed, uncomment when needed
-- vim.lsp.config.sqls = {
--   cmd = {"sqls"},
--   filetypes = {"sql"},
--   root_markers = {".git"},
--   settings = {
--     sqls = {
--       connections = {
--         -- Example connections (customize as needed)
--         -- {
--         --   driver = "postgresql",
--         --   dataSourceName = "host=127.0.0.1 port=5432 user=postgres password=postgres dbname=mydb sslmode=disable",
--         -- },
--         -- {
--         --   driver = "mysql",
--         --   dataSourceName = "user:password@tcp(127.0.0.1:3306)/dbname",
--         -- },
--       },
--     },
--   },
-- }
--
-- vim.lsp.enable('sqls') 
