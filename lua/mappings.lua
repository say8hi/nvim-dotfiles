require "nvchad.mappings"

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("i", "<C-CR>", function()
        local enter = require("scripts.smart_enter")
        enter.EnterInsideQuotes()
      end,
  {desc = "Magic enter"}
)

 -- Normal
map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "gsd", ':vsplit<CR>:lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true, desc = "LSP definition in vsplit" })

map("n", "gr",
      function()
        local telescope = require('telescope.builtin')
        telescope.lsp_references()
      end
, { desc = "LSP references" })


-- map("n", "gd",
--       function()
--         local telescope = require('telescope.builtin')
--         telescope.lsp_definitions()
--       end
-- , { desc = "LSP definitions" })

map("n", "gi",
      function()
        local telescope = require('telescope.builtin')
        telescope.lsp_implementations()
      end
, { desc = "LSP references" })


map("n", "gh", function()
  vim.lsp.buf.hover()
end, { desc = "Show information about the symbol under the cursor" })


map("n", "<leader>gj", ":GoTagAdd json<CR>", { desc = "Add JSON tags" })


map("n", "ga", ":GoIfErr<CR>", { desc = "if err != nil {}" })

-- Debug
map("n", "<leader>dgt",
      function()
        require('dap-go').debug_test()
      end,
 { desc = "Debug go test" })


map("n", "<leader>dgl",
      function()
        require('dap-go').debug_last()
      end,
 { desc = "Debug last go test" })


map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
map("n", "<leader>dus",
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
{ desc = "Open debugging sidebar" })


map("n", "dn", "<cmd> DapStepOver <CR>", { desc = "DAP Next step" })
map("n", "<leader>dc", function() require('dap').continue() end, { desc = "Debug" })
map("n", "<leader>dc", function() require('dap').continue() end, { desc = "Debug" })

map("n", "n", "nzzzv", { desc = "centered move to the next find" })
map("n", "N", "Nzzzv", { desc = "centered move to the next find" })

map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "centered move to the next find" })

map("n", "<leader>ds", '<cmd>Telescope diagnostics<CR>', { desc = "LSP diagnostic loclist" })



-- Visual
map("v", "<S-down>", ":m '>+1<CR>gv=gv", { desc = "move selected down" })
map("v", "<S-up>", ":m '<-2<CR>gv=gv", { desc = "move selected up" })

map("v", "p", "\"_dP", { desc = "paste without copying" })
map("v", "c", "\"_c", { desc = "c without copying" })
-- map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
-- map("n", "<C-b>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
