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


map("n", "<leader>gj", "<cmd>GoTagAdd json<CR>", { desc = "Add JSON tags" })
map("n", "ga", "<cmd>GoIfErr<CR>", { desc = "if err != nil {}" })

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

map("n", "n", "nzzzv", { desc = "centered move to the next find" })
map("n", "N", "Nzzzv", { desc = "centered move to the next find" })

map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "centered move to the next find" })

map("n", "<leader>ds", '<cmd>Telescope diagnostics<CR>', { desc = "LSP diagnostic loclist" })

-- Visual
map("v", "<S-down>", ":m '>+1<CR>gv=gv", { desc = "move selected down" })
map("v", "<S-up>", ":m '<-2<CR>gv=gv", { desc = "move selected up" })

map("v", "p", "\"_dp", { desc = "paste without copying" })
map("v", "c", "\"_c", { desc = "c without copying" })

-- Undotree
map("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "Telescope Undo" })

-- Vim Visual Multi
vim.g.VM_maps = {
  ['Find Under'] = '<C-b>',
  ['Find Subword Under'] = '<C-b>',
}

-- Neoclip
map("n", "<leader>o", "<cmd>Telescope neoclip<CR>", { desc = "Telescope Neoclip" })

-- Harpoon
map("n", "<leader>ta", function() require("harpoon.mark").add_file() end, { desc = "Harpoon: Mark File" })
map("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Toggle Harpoon Menu" })

-- Todo Comments
map("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
map("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
