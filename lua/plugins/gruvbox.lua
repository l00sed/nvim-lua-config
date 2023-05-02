local cmd = vim.cmd
local o = vim.o

if os.getenv("THEME_VARIANT") == 'light' then
  o.background = "light"
else
  o.background = "dark"
end

require('gruvbox').setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    operators = true,
    comments = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = false, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = true,
  transparent_mode = false,
})

cmd [[colo gruvbox]]
