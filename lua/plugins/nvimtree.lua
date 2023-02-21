-- NVIM tree
local g = vim.g
local lib = require("nvim-tree.lib")

local git_add = function()
  local node = lib.get_node_at_cursor()
  local gs = node.git_status.file

  -- If the file is untracked, unstaged or partially staged, we stage it
  if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
    vim.cmd("silent !git add " .. node.absolute_path)
  -- If the file is staged, we unstage it
  elseif gs == "M " or gs == "A " then
    vim.cmd("silent !git restore --staged " .. node.absolute_path)
  end

  lib.refresh_tree()
end

local git_restore = function()
  local node = lib.get_node_at_cursor()
  local gs = node.git_status.file
  -- If the file is modified, we restore it
  vim.cmd("silent !git restore " .. node.absolute_path)
  lib.refresh_tree()
end

local function open_nvim_tree(data)
  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- create a new, empty buffer
  vim.cmd.enew()

  -- wipe the directory buffer
  vim.cmd.bw(data.buf)

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  update_cwd = true,
  remove_keymaps = { "<C-k>" },
  view = {
    adaptive_size = false,
    width = 30,
    number = false,
    mappings = {
      custom_only = false,
      list = {
        { key = "l", action = "edit" },
        { key = "h", action = "close_node" },
        { key = "H", action = "collapse_all" },
        { key = "ga", action = "git_add", action_cb = git_add },
        { key = "gr", action = "git_restore", action_cb = git_restore },
        { key = "i", action = "toggle_file_info" },
      }
    },
  },
  actions = {
    open_file = {
      quit_on_open = false
    }
  },
  renderer = {
    full_name = true,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  diagnostics = {
    enable = true,
  },
  git = {
    ignore = false,
    timeout = 500,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
})
