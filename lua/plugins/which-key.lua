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
wk.register({
  -- Gitsigns shorcuts
  ["<leader>td"] = { desc = "Toggle git diff in the current file" },
  ["<leader>tb"] = { desc = "Toggle git blame inline" },
  ["<leader>hb"] = { desc = "Toggle git hunk blame" },
  ["<leader>hd"] = { desc = "Toggle git hunk diff split" },
  ["<leader>hD"] = { desc = "Toggle git diff split" },
  ["<leader>hp"] = { desc = "Toggle git hunk diff popup" },
  ["<leader>hR"] = { desc = "Git reset changes for the current file" },
  ["<leader>hS"] = { desc = "Git stage changes for the current file" },
  ["<leader>hu"] = { desc = "Update git hunks/signs" },
})
