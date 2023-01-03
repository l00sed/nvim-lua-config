local wk = require('which-key')

wk.setup()
wk.register({
  -- Swap leader in normal mode
  --map("n", "<Space>", "<Nop>")
  ["<Space>"]   = { "<Nop>", "Replaces leader key" },

  -- Run omnifunc, mostly used for autocomplete
  --map("i", "<C-SPACE>", "<C-x><C-o>")
  ["<C-SPACE>"] = { "<C-x><C-o>", "Omnifunc, used for autocomplete", mode = "i" },

  -- Yank/copy from visual mode
  -- On Mac OS, extra translation step needed in iTerm2
  --map("v", "<C-c>", '"+y')
  ["<C-c>"]     = { '"+y', "Yank/copy from visual mode", mode = "v" },

  -- Move around windows (shifted to the right)
  -- Using together with vim-tmux-navigator plugin
  -- https://github.com/christoomey/vim-tmux-navigator
  ["<M-h>"] = { "<Cmd>TmuxNavigateLeft<CR>", "Navigate left (Vim/Tmux agnostic)" },
  --map("n", "<M-h>", "<Cmd>TmuxNavigateLeft<CR>")
  ["<M-j>"] = { "<Cmd>TmuxNavigateDown<CR>", "Navigate down (Vim/Tmux agnostic)" },
  --map("n", "<M-j>", "<Cmd>TmuxNavigateDown<CR>")
  ["<M-k>"] = { "<Cmd>TmuxNavigateUp<CR>", "Navigate up (Vim/Tmux agnostic)" },
  --map("n", "<M-k>", "<Cmd>TmuxNavigateUp<CR>")
  ["<M-l>"] = { "<Cmd>TmuxNavigateRight<CR>", "Navigate right (Vim/Tmux agnostic)" },
  --map("n", "<M-l>", "<Cmd>TmuxNavigateRight<CR>")
  ["<M-\\>"] = { "<Cmd>TmuxNavigatePrevious<CR>", "Navigate to the previous pane (Vim/Tmux agnostic)" },
  --map("n", "<M-\\>", "<Cmd>TmuxNavigatePrevious<CR>")

  ["<leader>"] = {
    -- Split vertically
    --map("n", "<leader>%", "<Cmd>vnew<CR>")
    ["%"]  = { "<Cmd>vnew<CR>", "Vertical split (Tmux-style)" },
    -- Split horizontally
    --map("n", "<leader>\"", "<Cmd>new<CR>")
    ["\""] = { "<Cmd>new<CR>", "Horizontal split (Tmux-style)" },
    -- Kill neovim pane like Tmux
    --map("n", "<leader>x", ":call ConfirmQuit(0)<CR>")
    x = { ":call ConfirmQuit(0)<CR>", "Kill Neovim pane (Tmux-style)" },
    -- Used with the ToggleOnly plugin, zoom the neovim pane like Tmux
    --map("n", "<leader>z", ":ToggleOnly<CR>")
    z = { ":ToggleOnly<CR>", "Zoom Neovim pane (Tmux-style)" },

    -- Fugitive
    --map("n", "<leader>G", ":G<CR>")
    G = { ":G<CR>", "Fugitive" },

    -- Remapped to use <M-k> for navigation
    --map("n", "<leader>k", '<Cmd>lua vim.lsp.buf.signature_help()<CR>');
    k = { '<Cmd>lua vim.lsp.buf.signature_help()<CR>', "LSP signature help" },
    -- Toggle in-line LSP debugging
    --map("n", "<leader>l", '<Cmd>lua require "lsp_lines".toggle()<CR>');
    l = { '<Cmd>lua require "lsp_lines".toggle()<CR>', "Toggle inline LSP virtual text" },
    -- Show line diagnostics
    --map("n", "<leader>d", '<Cmd>lua vim.diagnostic.open_float(0, {scope = "line"})<CR>')
    d = { '<Cmd>lua vim.diagnostic.open_float(0, {scope = "line"})<CR>', "Open LSP diagnostics in popup" },
    -- Open local diagnostics in local list
    --map("n", "<leader>D", "<Cmd>lua vim.diagnostic.setloclist()<CR>")
    D = {  "<Cmd>lua vim.diagnostic.setloclist()<CR>", "Open LSP diagnostics in new buffer" },
    -- Open all project diagnostics in quickfix list
    --map("n", "<leader><A-d>", "<Cmd>lua vim.diagnostic.setqflist()<CR>")
    ["<A-d>"] = { "<Cmd>lua vim.diagnostic.setqflist()<CR>", "Open LSP quickfix" },

    -- Telescope
    --map("n", "<leader>ff", "<Cmd>Telescope find_files<CR>")
    ff = { "<Cmd>Telescope find_files<CR>", "Telescope, find files" },
    --map("n", "<leader>fhf", "<Cmd>Telescope find_files hidden=true<CR>")
    fhf = { "<Cmd>Telescope find_files hidden=true<CR>", "Telescope, find files (hidden)" },
    --map("n", "<leader>fb", "<Cmd>Telescope buffers<CR>")
    fb = { "<Cmd>Telescope buffers<CR>", "Telescope, buffers" },
    --map("n", "<leader>fg", "<Cmd>Telescope live_grep<CR>")
    fg = { "<Cmd>Telescope live_grep<CR>", "Telescope, live grep" },

    -- File explorer
    --map("n", "<leader>n", "<Cmd>NvimTreeToggle<CR>") -- NvimTree
    n = { "<Cmd>NvimTreeToggle<CR>", "Toggle NvimTree" },
    -- nnoremap("<leader>e", "<Cmd>RnvimrToggle<CR>")

    -- EasyAlign
    -- xmap("ga", "<cmd>EasyAlign")
    -- nmap("ga", "<cmd>EasyAlign")

    -- Toggle Wrap
    --nomap("n", "<leader>tw", '<Cmd>lua require "utils".toggle_wrap()<CR>')
    tw = { '<Cmd>lua require "utils".toggle_wrap()<CR>', "Toggle wrapped lines", noremap = true },

    -- Tab navigation in vim
    -- -- Move to previous tab
    --nomap("n", "gt", ":bp<cr>")
    gt = { ":bp<CR>", "Previous tab", noremap = true },
    -- -- Move to next tab
    --nomap("n", "gT", ":bn<cr>")
    gT = { ":bn<CR>", "Next tab", noremap = true },
    -- -- Close current tab
    --nomap("n", "<leader>c", ":bw<cr>")
    c = { ":bw<CR>", "Close tab", noremap = true },
  },

  -- Neoscroll
  --map("n", "<C-u>", "<Cmd>lua require('neoscroll').scroll(-(vim.api.nvim_win_get_height(0)/2), true, 500)<CR>")  -- Up
  ["<C-u>"] = { "<Cmd>lua require('neoscroll').scroll(-(vim.api.nvim_win_get_height(0)/2), true, 500)<CR>", "Smooth-scroll up" },
  --map("n", "<C-d>", "<Cmd>lua require('neoscroll').scroll(-(vim.api.nvim_win_get_height(0)/2), true, 500)<CR>")  -- Up
  ["<C-d>"] = { "<Cmd>lua require('neoscroll').scroll(-(vim.api.nvim_win_get_height(0)/2), true, 500)<CR>", "Smooth-scroll up" },
  --map("n", "<C-f>", "<Cmd>lua require('neoscroll').scroll((vim.api.nvim_win_get_height(0)/2), true, 500)<CR>")  -- Down
  ["<C-f>"] = { "<Cmd>lua require('neoscroll').scroll((vim.api.nvim_win_get_height(0)/2), true, 500)<CR>", "Smooth-scroll down" },
})
