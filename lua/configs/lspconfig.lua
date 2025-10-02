require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local util = require "lspconfig.util"

-- GOPLS
vim.lsp.config.gopls = {
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_markers = {"go.work", "go.mod", ".git"},
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
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true
      }
    }
  }
}

vim.lsp.enable('gopls')

-- RUFF LSP
vim.lsp.config.ruff = {
  cmd = {"ruff", "server"},
  filetypes = {"python"},
  root_markers = {"pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git"},
}

-- PYRIGHT
vim.lsp.config.pyright = {
  cmd = {"pyright-langserver", "--stdio"},
  filetypes = {"python"},
  root_markers = {"pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git"},
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

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "ruff" then
      on_attach(client, args.buf)
    elseif client and client.name == "pyright" then
      on_attach(client, args.buf)
    end
  end,
})

vim.lsp.enable('ruff')
vim.lsp.enable('pyright')

-- JSON
vim.lsp.config.jsonls = {
  cmd = {"vscode-json-language-server", "--stdio"},
  filetypes = {"json", "jsonc"},
  root_markers = {".git"},
}

vim.lsp.enable('jsonls')

-- TypeScript/JavaScript
vim.lsp.config.ts_ls = {
  cmd = {"typescript-language-server", "--stdio"},
  filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
  root_markers = {"package.json", "tsconfig.json", "jsconfig.json", ".git"},
}

vim.lsp.enable('ts_ls')

-- HTML
vim.lsp.config.html = {
  cmd = {"vscode-html-language-server", "--stdio"},
  filetypes = {"html"},
  root_markers = {".git"},
}

vim.lsp.enable('html')

-- CSS
vim.lsp.config.cssls = {
  cmd = {"vscode-css-language-server", "--stdio"},
  filetypes = {"css", "scss", "less"},
  root_markers = {".git"},
}

vim.lsp.enable('cssls') 
