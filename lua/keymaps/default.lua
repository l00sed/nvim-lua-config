local map = vim.keymap.set

-- Swap leader in normal mode
map({ "n" }, "<Nop>", "<Space>", { silent = true, desc = "Replaces leader key" })
-- Run omnifunc, mostly used for autocomplete
map({ "i" }, "<C-x><C-o>", "<C-SPACE>", { silent = true, desc = "Omnifunc, used for autocomplete" })
-- Yank/copy from visual mode
-- On Mac OS, extra translation step needed in iTerm2
map({ "v" }, "<C-c>", '"+y', { silent = true, desc = "Yank/copy from visual mode" })
-- Toggle Wrap
map({ "n" }, '<leader>tw', '<Cmd>lua require("utils").toggle_wrap()<CR>', { silent = true, desc = "Toggle wrapped lines", noremap = true })
-- Tab navigation in vim
-- -- Move to previous tab
map({ "n" }, '<leader>gt', "<Cmd>bp<CR>", { silent = true, desc = "Previous tab", noremap = true })
-- -- Move to next tab
map({ "n" }, '<leader>gT', "<Cmd>bn<CR>", { silent = true, desc = "Next tab", noremap = true })
-- -- Close current tab
map({ "n" }, '<leader>c', "<Cmd>bw<CR>", { silent = true, desc = "Close tab", noremap = true })
-- Horizontal Scrolling with Mouse (hold control key)
map({ "n" }, "10zl", "<C-ScrollWheelDown>", { silent = true, desc = 'Horizontal scroll left, hold ctrl key' })
map({ "n" }, "10zl", "<C-2-ScrollWheelDown>", { silent = true, desc = 'Horizontal scroll left, hold ctrl key' })
map({ "n" }, "10zl", "<C-3-ScrollWheelDown>", { silent = true, desc = 'Horizontal scroll left, hold ctrl key' })
map({ "n" }, "10zl", "<C-4-ScrollWheelDown>", { silent = true, desc = 'Horizontal scroll left, hold ctrl key' })
map({ "n" }, "10zh", "<C-ScrollWheelUp>", { silent = true, desc = 'Horizontal scroll right, hold ctrl key' })
map({ "n" }, "10zh<silent>", "<C-2-ScrollWheelUp>", { silent = true, desc = 'Horizontal scroll right, hold ctrl key' })
map({ "n" }, "10zh<silent>", "<C-3-ScrollWheelUp>", { silent = true, desc = 'Horizontal scroll right, hold ctrl key' })
map({ "n" }, "10zh<silent>", "<C-4-ScrollWheelUp>", { silent = true, desc = 'Horizontal scroll right, hold ctrl key' })