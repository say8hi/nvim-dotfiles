vim.g.mapleader = " "

-- temporary stub for nvchad base46_cache (will be removed in step 7)
vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad_stub/"

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

vim.opt.clipboard = "unnamedplus"

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
  require "configs.lsp"
end)
