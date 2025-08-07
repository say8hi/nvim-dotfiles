pcall(function()
  dofile(vim.g.base46_cache .. "syntax")
  dofile(vim.g.base46_cache .. "treesitter")
end)

return {
  ensure_installed = {"python", "go", "lua", "luadoc", "printf", "vim", "vimdoc", "json" },

  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_highlighting = true,
  },

  indent = { enable = true },
}
