local map = vim.keymap.set

-- Move around windows (shifted to the right)
-- Using together with vim-tmux-navigator plugin
-- https://github.com/christoomey/vim-tmux-navigator
map({ "n" }, "<M-h>", "<Cmd>TmuxNavigateLeft<CR>", { silent = true, desc = "Navigate left (Vim/Tmux agnostic)" })
map({ "n" }, "<M-j>", "<Cmd>TmuxNavigateDown<CR>", { silent = true, desc = "Navigate down (Vim/Tmux agnostic)" })
map({ "n" }, "<M-k>", "<Cmd>TmuxNavigateUp<CR>", { silent = true, desc = "Navigate up (Vim/Tmux agnostic)" })
map({ "n" }, "<M-l>", "<Cmd>TmuxNavigateRight<CR>", { silent = true, desc = "Navigate right (Vim/Tmux agnostic)" })
map({ "n" }, "<M-\\>", "<Cmd>TmuxNavigatePrevious<CR>", { silent = true, desc = "Navigate to the previous pane (Vim/Tmux agnostic)" })
-- Tmux/Vim resizing
map({ "n" }, "<C-h>", "<Cmd>TmuxResizeLeft<CR> | <CMD>lua require('bufferline.api').set_offset(require('nvim-tree.view').View.width)<CR>", { remap = true, silent = true, desc = 'Resize Neovim pane horizontally' })
map({ "n" }, "<C-j>", "<Cmd>TmuxResizeDown<CR> | <CMD>lua require('bufferline.api').set_offset(require('nvim-tree.view').View.width)<CR>", { remap = true, silent = true, desc = 'Resize Neovim pane vertically' })
map({ "n" }, "<C-k>", "<Cmd>TmuxResizeUp<CR> | <CMD>lua require('bufferline.api').set_offset(require('nvim-tree.view').View.width)<CR>", { remap = true, silent = true, desc = 'Resize Neovim pane vertically' })
map({ "n" }, "<C-l>", "<Cmd>TmuxResizeRight<CR> | <CMD>lua require('bufferline.api').set_offset(require('nvim-tree.view').View.width)<CR>", { remap = true, silent = true, desc = 'Resize Neovim pane horizontally' })
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
-- BarBar (tabs)
-- -- Goto buffer in position...
map({ "n" }, '<A-1>', '<Cmd>BufferGoto 1<CR>', { silent = true, desc = 'Goto tab 1' })
map({ "n" }, '<A-2>', '<Cmd>BufferGoto 2<CR>', { silent = true, desc = 'Goto tab 2' })
map({ "n" }, '<A-3>', '<Cmd>BufferGoto 3<CR>', { silent = true, desc = 'Goto tab 3' })
map({ "n" }, '<A-4>', '<Cmd>BufferGoto 4<CR>', { silent = true, desc = 'Goto tab 4' })
map({ "n" }, '<A-5>', '<Cmd>BufferGoto 5<CR>', { silent = true, desc = 'Goto tab 5' })
map({ "n" }, '<A-6>', '<Cmd>BufferGoto 6<CR>', { silent = true, desc = 'Goto tab 6' })
map({ "n" }, '<A-7>', '<Cmd>BufferGoto 7<CR>', { silent = true, desc = 'Goto tab 7' })
map({ "n" }, '<A-8>', '<Cmd>BufferGoto 8<CR>', { silent = true, desc = 'Goto tab 8' })
map({ "n" }, '<A-9>', '<Cmd>BufferGoto 9<CR>', { silent = true, desc = 'Goto tab 9' })
map({ "n" }, '<A-0>', '<Cmd>BufferLast<CR>', { silent = true, desc = 'Goto last tab' })
-- -- Rearrange buffer tabs
map({ "n" }, '<A-<>', '<Cmd>BufferMovePrevious<CR>', { silent = true, desc = 'Move tab left' })
map({ "n" }, '<A->>', '<Cmd>BufferMoveNext<CR>', { silent = true, desc = 'Move tab right' })
-- -- Goto buffer in position...
map({ "n" }, '<leader>1', '<Cmd>BufferGoto 1<CR>', { silent = true, desc = 'Goto tab 1' })
map({ "n" }, '<leader>2', '<Cmd>BufferGoto 2<CR>', { silent = true, desc = 'Goto tab 2' })
map({ "n" }, '<leader>3', '<Cmd>BufferGoto 3<CR>', { silent = true, desc = 'Goto tab 3' })
map({ "n" }, '<leader>4', '<Cmd>BufferGoto 4<CR>', { silent = true, desc = 'Goto tab 4' })
map({ "n" }, '<leader>5', '<Cmd>BufferGoto 5<CR>', { silent = true, desc = 'Goto tab 5' })
map({ "n" }, '<leader>6', '<Cmd>BufferGoto 6<CR>', { silent = true, desc = 'Goto tab 6' })
map({ "n" }, '<leader>7', '<Cmd>BufferGoto 7<CR>', { silent = true, desc = 'Goto tab 7' })
map({ "n" }, '<leader>8', '<Cmd>BufferGoto 8<CR>', { silent = true, desc = 'Goto tab 8' })
map({ "n" }, '<leader>9', '<Cmd>BufferGoto 9<CR>', { silent = true, desc = 'Goto tab 9' })
map({ "n" }, '<leader>0', '<Cmd>BufferLast<CR>', { silent = true, desc = 'Goto last tab' })
-- -- Pin a buffer
map({ "n" }, '<A-p>', '<Cmd>BufferPin<CR>', { silent = true, desc = 'Pin/Unpin the current buffer' })
-- -- Close buffer
map({ "n" }, '<leader>c', '<Cmd>BufferClose<CR>', { silent = true, desc = 'Close current buffer' })
-- -- Navigate buffers
map({ "n" }, '<leader>gt', '<Cmd>BufferPrev<CR>', { silent = true, desc = 'Focus buffer on prev tab' })
map({ "n" }, '<leader>gT', '<Cmd>BufferNext<CR>', { silent = true, desc = 'Focus buffer on next tab' })
map({ "n" }, '<A-,>', '<Cmd>BufferPrev<CR><CR>', { silent = true, desc = 'Focus buffer on prev tab' })
map({ "n" }, '<A-.>', '<Cmd>BufferNext<CR><CR>', { silent = true, desc = 'Focus buffer on next tab' })
-- Telescope
map({ "n" }, '<leader>ff', "<Cmd>Telescope find_files<CR>", { silent = true, desc = "Telescope, find files" })
map({ "n" }, '<leader>fhf', "<Cmd>Telescope find_files hidden=true<CR>", { silent = true, desc = "Telescope, find files (hidden)" })
map({ "n" }, '<leader>fb', "<Cmd>Telescope buffers<CR>", { silent = true, desc = "Telescope, buffers" })
map({ "n" }, '<leader>fg', "<Cmd>Telescope live_grep<CR>", { silent = true, desc = "Telescope, live grep" })
map({ "n" }, '<leader>ft', "<Cmd>TodoTelescope<CR>", { silent = true, desc = "Telescope, find todos" })
-- File explorer
map({ "n" }, '<leader>n', "<Cmd>NvimTreeToggle<CR>", { silent = true, desc = "Toggle NvimTree" })
map({ "n" }, '<leader>aa', "<Cmd>lua require('utils').add_marked_to_args()<CR>", { silent = true, desc = "Add NvimTree marked files to argdo arg list" })
map({ "n" }, '<leader>ad', "<Cmd>%argdelete<CR>", { silent = true, desc = "Clear arg list" })
map({ "n" }, '<leader>al', "<Cmd>arg<CR>", { silent = true, desc = "List arglist files" })
-- EasyAlign
-- xmap("ga", "<cmd>EasyAlign")
-- nmap("ga", "<cmd>EasyAlign")
-- DoGe (Documentation Generator)
map({ "n" }, '<leader>Do', '<Cmd>DogeGenerate<CR>', { silent = true, desc = "Generate documentation for the highlighted function" })
-- Which-Key
map({ "n" }, '<leader>W', '<Cmd>W <leader><CR>', { silent = true, desc = "Which-key window" })
-- Neoscroll
map({ "n" }, "<C-u>", "<Cmd>lua require('neoscroll').scroll(-20, true, 100)<CR>", { silent = true, desc = "Smooth-scroll up" })
map({ "n" }, "<C-d>", "<Cmd>lua require('neoscroll').scroll(20, true, 100)<CR>", { silent = true, desc = "Smooth-scroll down" })
map({ "n" }, "<C-f>", "<Cmd>lua require('neoscroll').scroll(-20, true, 100)<CR>", { silent = true, desc = "Smooth-scroll up" })
-- Todo
map({ "n" }, "<leader>T", "<Cmd>TodoLocList<CR>", { silent = true, desc = "Open todo quickfix list for the local file" })
