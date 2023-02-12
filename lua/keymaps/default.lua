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
-- NOTE: Commented out in favor of the barbar.nvim "Buffer{Next,Prev,Close}" commands

-- map({ "n" }, '<leader>gt', "<Cmd>bp<CR>", { silent = true, desc = "Previous tab", noremap = true })
-- map({ "n" }, '<leader>gT', "<Cmd>bn<CR>", { silent = true, desc = "Next tab", noremap = true })
-- map({ "n" }, '<leader>c', "<Cmd>bw<CR>", { silent = true, desc = "Close tab", noremap = true })

-- Horizontal Scrolling with Mouse (hold control key)
map({ "n" }, "10zl", "<C-ScrollWheelDown>", { silent = true, desc = 'Horizontal scroll left, hold ctrl key' })
map({ "n" }, "10zl", "<C-2-ScrollWheelDown>", { silent = true, desc = 'Horizontal scroll left, hold ctrl key' })
map({ "n" }, "10zl", "<C-3-ScrollWheelDown>", { silent = true, desc = 'Horizontal scroll left, hold ctrl key' })
map({ "n" }, "10zl", "<C-4-ScrollWheelDown>", { silent = true, desc = 'Horizontal scroll left, hold ctrl key' })
map({ "n" }, "10zh", "<C-ScrollWheelUp>", { silent = true, desc = 'Horizontal scroll right, hold ctrl key' })
map({ "n" }, "10zh<silent>", "<C-2-ScrollWheelUp>", { silent = true, desc = 'Horizontal scroll right, hold ctrl key' })
map({ "n" }, "10zh<silent>", "<C-3-ScrollWheelUp>", { silent = true, desc = 'Horizontal scroll right, hold ctrl key' })
map({ "n" }, "10zh<silent>", "<C-4-ScrollWheelUp>", { silent = true, desc = 'Horizontal scroll right, hold ctrl key' })
-- Syntax group
map({ "n" }, '<leader>sg', "<Cmd>lua local result = vim.treesitter.get_captures_at_cursor(0); print(vim.inspect(result))<CR>", { desc = "Get highlight group under cursor" })
