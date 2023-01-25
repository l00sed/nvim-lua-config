local map = vim.keymap.set

-- Move around windows (shifted to the right)
-- Using together with vim-tmux-navigator plugin
-- https://github.com/christoomey/vim-tmux-navigator
map({ "n" }, "<M-h>", "<Cmd>TmuxNavigateLeft<CR>", { silent = true, desc = "Navigate left (Vim/Tmux agnostic)" })
map({ "n" }, "<M-j>", "<Cmd>TmuxNavigateDown<CR>", { silent = true, desc = "Navigate down (Vim/Tmux agnostic)" })
map({ "n" }, "<M-k>", "<Cmd>TmuxNavigateUp<CR>", { silent = true, desc = "Navigate up (Vim/Tmux agnostic)" })
map({ "n" }, "<M-l>", "<Cmd>TmuxNavigateRight<CR>", { silent = true, desc = "Navigate right (Vim/Tmux agnostic)" })
map({ "n" }, "<M-\\>", "<Cmd>TmuxNavigatePrevious<CR>", { silent = true, desc = "Navigate to the previous pane (Vim/Tmux agnostic)" })
-- Split vertically
map({ "n" }, "<leader>%", "<Cmd>vnew<CR>", { silent = true, desc = "Vertical split (Tmux-style)" })
-- Split horizontally
map({ "n" }, '<leader>"', "<Cmd>new<CR>", { silent = true, desc = "Horizontal split (Tmux-style)" })
-- Kill neovim pane like Tmux
map({ "n" }, "<leader>x", "<Cmd>call ConfirmQuit(0)<CR>", { silent = true, desc = "Kill Neovim pane (Tmux-style)" })
-- Used with the ToggleOnly plugin, zoom the neovim pane like Tmux
map({ "n" }, "<leader>z", "<Cmd>ToggleOnly<CR>", { silent = true, desc = "Zoom Neovim pane (Tmux-style)" })
-- ZenMode
map({ "n" }, "<leader>Z", "<Cmd>ZenMode<CR>", { silent = true, desc = "ZenMode" })
-- Fugitive
map({ "n" }, "<leader>G", "<Cmd>G<CR>", { silent = true, desc = "Fugitive" })
-- Signature Help
map({ "n" }, "<leader>k", '<Cmd>lua vim.lsp.buf.signature_help()<CR>', { silent = true, desc = "LSP signature help" })
-- Toggle in-line LSP debugging
map({ "n" }, '<leader>l', '<Cmd>lua require "lsp_lines".toggle()<CR>', { silent = true, desc = "Toggle inline LSP virtual text" })
-- Show line diagnostics
map({ "n" }, '<leader>d', '<Cmd>lua require("utils").open_float()<CR>', { silent = true, desc = "Open LSP diagnostics in popup" })
-- Open local diagnostics in local list
map({ "n" }, '<leader>D', '<Cmd>lua vim.diagnostic.setloclist()<CR>', { silent = true, desc = "Open LSP diagnostics in new buffer" })
-- Null-ls
map({ "n" }, '<leader>lf', '<Cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>', { silent = true, desc = "Enable linting" })
-- Open all project diagnostics in quickfix list
map({ "n" }, '<leader>qf', "<Cmd>lua vim.diagnostic.setqflist()<CR>", { silent = true, desc = "Open LSP quickfix" })
-- Telescope
map({ "n" }, '<leader>ff', "<Cmd>Telescope find_files<CR>", { silent = true, desc = "Telescope, find files" })
map({ "n" }, '<leader>fhf', "<Cmd>Telescope find_files hidden=true<CR>", { silent = true, desc = "Telescope, find files (hidden)" })
map({ "n" }, '<leader>fb', "<Cmd>Telescope buffers<CR>", { silent = true, desc = "Telescope, buffers" })
map({ "n" }, '<leader>fg', "<Cmd>Telescope live_grep<CR>", { silent = true, desc = "Telescope, live grep" })
-- File explorer
map({ "n" }, '<leader>n', "<Cmd>NvimTreeToggle<CR>", { silent = true, desc = "Toggle NvimTree" })
-- EasyAlign
-- xmap("ga", "<cmd>EasyAlign")
-- nmap("ga", "<cmd>EasyAlign")
-- DoGe (Documentation Generator)
map({ "n" }, '<leader>Do', '<Cmd>DogeGenerate<CR>', { silent = true, desc = "Generate documentation for the highlighted function" })
-- Which-Key
map({ "n" }, '<leader>W', '<Cmd>W <leader><CR>', { silent = true, desc = "Which-key window" })
-- Neoscroll
map({ "n" }, "<C-u>", "<Cmd>lua require('neoscroll').scroll(-10, true, 200)<CR>", { silent = true, desc = "Smooth-scroll up" })
map({ "n" }, "<C-d>", "<Cmd>lua require('neoscroll').scroll(10, true, 200)<CR>", { silent = true, desc = "Smooth-scroll down" })
map({ "n" }, "<C-f>", "<Cmd>lua require('neoscroll').scroll(-10, true, 200)<CR>", { silent = true, desc = "Smooth-scroll up" })
