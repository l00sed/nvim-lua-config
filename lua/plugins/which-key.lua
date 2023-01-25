local wk = require('which-key')

local opts = {
  popup_mappings = {
    scroll_down = '<c-d>',
    scroll_up = '<c-f>',
  },
  window = {
    border = 'single',
    padding = { 2, 4, 2, 4 },
    winblend = 0
  },
  ignore_missing = false,
}

wk.setup(opts)
