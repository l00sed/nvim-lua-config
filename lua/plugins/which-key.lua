local wk = require('which-key')

local opts = {
  popup_mappings = {
    scroll_down = '<c-d>',
    scroll_up = '<c-f>',
  },
  window = {
    border = 'single',
    padding = { 2, 4, 2, 4 },
    winblend = 15
  },
  ignore_missing = true,
}

wk.setup(opts)

wk.register({
  -- Swap leader in normal mode
  ["<Space>"]   = { "<Nop>", "Replaces leader key" },

  -- Run omnifunc, mostly used for autocomplete
  ["<C-SPACE>"] = { "<C-x><C-o>", "Omnifunc, used for autocomplete", mode = "i" },

  -- Yank/copy from visual mode
  -- On Mac OS, extra translation step needed in iTerm2
  ["<C-c>"]     = { '"+y', "Yank/copy from visual mode", mode = "v" },

  -- Move around windows (shifted to the right)
  -- Using together with vim-tmux-navigator plugin
  -- https://github.com/christoomey/vim-tmux-navigator
  ["<M-h>"] = { "<Cmd>TmuxNavigateLeft<CR>", "Navigate left (Vim/Tmux agnostic)" },
  ["<M-j>"] = { "<Cmd>TmuxNavigateDown<CR>", "Navigate down (Vim/Tmux agnostic)" },
  ["<M-k>"] = { "<Cmd>TmuxNavigateUp<CR>", "Navigate up (Vim/Tmux agnostic)" },
  ["<M-l>"] = { "<Cmd>TmuxNavigateRight<CR>", "Navigate right (Vim/Tmux agnostic)" },
  ["<M-\\>"] = { "<Cmd>TmuxNavigatePrevious<CR>", "Navigate to the previous pane (Vim/Tmux agnostic)" },

  ["<leader>"] = {
    -- Split vertically
    ["%"]  = { "<Cmd>vnew<CR>", "Vertical split (Tmux-style)" },
    -- Split horizontally
    ["\""] = { "<Cmd>new<CR>", "Horizontal split (Tmux-style)" },
    -- Kill neovim pane like Tmux
    x = { ":call ConfirmQuit(0)<CR>", "Kill Neovim pane (Tmux-style)" },
    -- Used with the ToggleOnly plugin, zoom the neovim pane like Tmux
    z = { ":ToggleOnly<CR>", "Zoom Neovim pane (Tmux-style)" },
    -- ZenMode
    Z = { ":ZenMode<CR>", "ZenMode" },

    -- Fugitive
    G = { ":G<CR>", "Fugitive" },

    -- Signature Help
    k = { '<Cmd>lua vim.lsp.buf.signature_help()<CR>', "LSP signature help" },
    -- Toggle in-line LSP debugging
    l = { '<Cmd>lua require "lsp_lines".toggle()<CR>', "Toggle inline LSP virtual text" },
    -- Show line diagnostics
    d = { '<Cmd>lua vim.diagnostic.open_float(0, {scope = "line"})<CR>', "Open LSP diagnostics in popup" },
    -- Open local diagnostics in local list
    --D = {  '<Cmd>lua vim.diagnostic.setloclist()<CR>', "Open LSP diagnostics in new buffer" },
    -- Null-ls
    lf = { '<Cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>', "Enable linting" },
    -- Open all project diagnostics in quickfix list
    ["<A-d>"] = { "<Cmd>lua vim.diagnostic.setqflist()<CR>", "Open LSP quickfix" },

    -- Telescope
    ff = { "<Cmd>Telescope find_files<CR>", "Telescope, find files" },
    fhf = { "<Cmd>Telescope find_files hidden=true<CR>", "Telescope, find files (hidden)" },
    fb = { "<Cmd>Telescope buffers<CR>", "Telescope, buffers" },
    fg = { "<Cmd>Telescope live_grep<CR>", "Telescope, live grep" },

    -- File explorer
    n = { "<Cmd>NvimTreeToggle<CR>", "Toggle NvimTree" },

    -- EasyAlign
    -- xmap("ga", "<cmd>EasyAlign")
    -- nmap("ga", "<cmd>EasyAlign")

    -- Toggle Wrap
    tw = { '<Cmd>lua require "utils".toggle_wrap()<CR>', "Toggle wrapped lines", noremap = true },

    -- Tab navigation in vim
    -- -- Move to previous tab
    gt = { ":bp<CR>", "Previous tab", noremap = true },
    -- -- Move to next tab
    gT = { ":bn<CR>", "Next tab", noremap = true },
    -- -- Close current tab
    c = { ":bw<CR>", "Close tab", noremap = true },

    -- DoGe (Documentation Generator)
    D = { ':DogeGenerate<CR>', "Generate documentation for the highlighted function" },

    -- Which-Key
    W = { ':W <leader><CR>', "Which-key window" },
  },

  -- Horizontal Scrolling with Mouse (hold control key)
  ["<C-ScrollWheelDown>"] = { "10zl", 'Horizontal scroll left, hold ctrl key', silent = true },
  ["<C-2-ScrollWheelDown>"] = { "10zl", 'Horizontal scroll left, hold ctrl key', silent = true },
  ["<C-3-ScrollWheelDown>"] = { "10zl", 'Horizontal scroll left, hold ctrl key', silent = true },
  ["<C-4-ScrollWheelDown>"] = { "10zl", 'Horizontal scroll left, hold ctrl key', silent = true },
  ["<C-ScrollWheelUp>"] = { "10zh", 'Horizontal scroll right, hold ctrl key', silent = true },
  ["<C-2-ScrollWheelUp>"] = { "10zh<silent>", 'Horizontal scroll right, hold ctrl key', silent = true },
  ["<C-3-ScrollWheelUp>"] = { "10zh<silent>", 'Horizontal scroll right, hold ctrl key', silent = true },
  ["<C-4-ScrollWheelUp>"] = { "10zh<silent>", 'Horizontal scroll right, hold ctrl key', silent = true },

  -- Neoscroll
  ["<C-u>"] = { "<Cmd>lua require('neoscroll').scroll(-10, true, 200)<CR>", "Smooth-scroll up" },
  ["<C-d>"] = { "<Cmd>lua require('neoscroll').scroll(10, true, 200)<CR>", "Smooth-scroll down" },
  ["<C-f>"] = { "<Cmd>lua require('neoscroll').scroll(-10, true, 200)<CR>", "Smooth-scroll up" },
})
