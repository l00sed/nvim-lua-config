-- copilot
vim.g.copilot_no_tab_map = true
--vim.keymap.set({ "i" }, "<C-w>", "<Plug>(copilot-accept-word)", { silent = true, desc = "Toggle CodeCompanion Chat" })
vim.keymap.set({ "i" }, "<C-l>", "<Plug>(copilot-accept-line)", { silent = true, desc = "Toggle CodeCompanion Chat" })
vim.keymap.set({ "i" }, "<C-e>", 'copilot#Accept("\\<CR>")', { silent = true, expr = true,  replace_keycodes = false })
