-- User commands

-- Theme switcher command
vim.api.nvim_create_user_command("ThemeSwitch", function(opts)
  local theme_switcher = require "scripts.theme_switcher"
  if opts.args ~= "" then
    theme_switcher.switch_theme(opts.args)
  else
    theme_switcher.select_theme()
  end
end, {
  nargs = "?",
  complete = function()
    return require("scripts.theme_switcher").get_themes()
  end,
  desc = "Switch colorscheme theme",
})
