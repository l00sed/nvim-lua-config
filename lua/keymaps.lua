-- the file "lua/lsp/utils.lua" contains lsp-specific commands.
local Utils = require('utils')

-- Library alias variables
local g = vim.g
--local o = vim.o
--local cmd = vim.cmd
--local inspect = vim.inspect

-- local exprnnomap = Utils.exprnnoremap
--local map = Utils.map
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

-- Horizontal scroll while holding control
nomap("n", "<C-ScrollWheelDown>", "10zl")
nomap("n", "<C-2-ScrollWheelDown>", "10zl")
nomap("n", "<C-3-ScrollWheelDown>", "10zl")
nomap("n", "<C-4-ScrollWheelDown>", "10zl")
nomap("n", "<C-ScrollWheelUp>", "10zh")
nomap("n", "<C-2-ScrollWheelUp>", "10zh")
nomap("n", "<C-3-ScrollWheelUp>", "10zh")
nomap("n", "<C-4-ScrollWheelUp>", "10zh")
