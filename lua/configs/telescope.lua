dofile(vim.g.base46_cache .. "telescope")

return {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
      width = 0.87,
      height = 0.80,
    },
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
    -- Показывать файлы из .gitignore
    file_ignore_patterns = {}, -- Убираем игнорирование
    -- Или можно использовать:
    -- vimgrep_arguments = {
    --   "rg",
    --   "--color=never",
    --   "--no-heading",
    --   "--with-filename",
    --   "--line-number",
    --   "--column",
    --   "--smart-case",
    --   "--no-ignore", -- Не игнорировать файлы из .gitignore
    -- },
  },
  pickers = {
    find_files = {
      hidden = true,
      no_ignore = true, -- Показывать файлы из .gitignore
    },
  },
  extensions_list = { "themes", "terms" },
  extensions = {},
}
