-- General keymaps that are not plugin dependant
-- the file "lua/lsp/utils.lua" contains lsp-specific commands.

local Utils = require('utils')

-- Library alias variables
local g = vim.g
local o = vim.o
local cmd = vim.cmd
local inspect = vim.inspect
-- local exprnnomap = Utils.exprnnoremap
local map = Utils.map
local nomap = Utils.noremap
-- local nnomap = Utils.nnoremap
-- local vnomap = Utils.vnoremap
-- local xnomap = Utils.xnoremap
-- local inomap = Utils.inoremap
-- local tnomap = Utils.tnoremap
-- local nmap = Utils.nmap
-- local xmap = Utils.xmap

g.mapleader = " "
g.maplocalleader = " "

-- Swap leader in normal mode
map("n", "<Space>", "<Nop>")

-- Run omnifunc, mostly used for autocomplete
map("i", "<C-SPACE>", "<C-x><C-o>")

-- Yank/copy from visual mode
-- On Mac OS, extra translation step needed in iTerm2
map("v", "<C-c>", '"+y')

-- Move around windows (shifted to the right)
cmd('let g:tmux_navigator_no_mappings = 1')
map("n", "<M-h>", "<Cmd>TmuxNavigateLeft<cr>")
map("n", "<M-j>", "<Cmd>TmuxNavigateDown<cr>")
map("n", "<M-k>", "<Cmd>TmuxNavigateUp<cr>")
map("n", "<M-l>", "<Cmd>TmuxNavigateRight<cr>")
map("n", "<M-\\>", "<Cmd>TmuxNavigatePrevious<cr>")

-- Fugitive
map("n", "<leader>G", ":G<CR>")

-- Show line diagnostics
map("n", "<leader>d", '<Cmd>lua vim.diagnostic.open_float(0, {scope = "line"})<CR>')

-- Toggle diagnostics
vim.keymap.set(
  "",
  "<Leader>l",
  require("lsp_lines").toggle,
  { desc = "Toggle lsp_lines" }
)

-- Open local diagnostics in local list
map("n", "<leader>D", "<Cmd>lua vim.diagnostic.setloclist()<CR>")

-- Open all project diagnostics in quickfix list
map("n", "<leader><A-d>", "<Cmd>lua vim.diagnostic.setqflist()<CR>")

-- Telescope
map("n", "<leader>ff", "<Cmd>Telescope find_files<CR>")
map("n", "<leader>fhf", "<Cmd>Telescope find_files hidden=true<CR>")
map("n", "<leader>fb", "<Cmd>Telescope buffers<CR>")
map("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>")

-- File explorer
map("n", "<leader>n", "<Cmd>NvimTreeToggle<CR>") -- NvimTree
-- nnoremap("<leader>e", "<Cmd>RnvimrToggle<CR>")

-- EasyAlign
-- xmap("ga", "<cmd>EasyAlign")
-- nmap("ga", "<cmd>EasyAlign")

-- Toggle Wrap
nomap("n", "<leader>tw", '<Cmd>lua require "utils".toggle_wrap()<CR>')

-- Horizontal scroll while holding control
nomap("n", "<C-ScrollWheelDown>", "10zl")
nomap("n", "<C-2-ScrollWheelDown>", "10zl")
nomap("n", "<C-3-ScrollWheelDown>", "10zl")
nomap("n", "<C-4-ScrollWheelDown>", "10zl")
nomap("n", "<C-ScrollWheelUp>", "10zh")
nomap("n", "<C-2-ScrollWheelUp>", "10zh")
nomap("n", "<C-3-ScrollWheelUp>", "10zh")
nomap("n", "<C-4-ScrollWheelUp>", "10zh")

-- Tab navigation in vim
-- -- Move to previous tab
nomap("n", "gt", ":bp<cr>")
-- -- Move to next tab
nomap("n", "gT", ":bn<cr>")
-- -- Close current tab
nomap("n", "<leader>c", ":bw<cr>")
-- -- Use "Alt" + TAB_NUMBER to switch between tabs
nomap("n", "<M-1>", "1<C-6>")
nomap("n", "<M-2>", "2<C-6>")
nomap("n", "<M-3>", "3<C-6>")
nomap("n", "<M-4>", "4<C-6>")
nomap("n", "<M-5>", "5<C-6>")
nomap("n", "<M-6>", "6<C-6>")
nomap("n", "<M-7>", "7<C-6>")
nomap("n", "<M-8>", "8<C-6>")
nomap("n", "<M-9>", "9<C-6>")

-- Toggle in-line LSP debugging
map("n", "<Leader>l", '<Cmd>lua require "lsp_lines".toggle()<CR>');
