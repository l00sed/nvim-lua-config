-- NVIM tree
local g = vim.g

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  disable_netrw = true,
  hijack_netrw = true,
  update_cwd = true,
  view = {
    adaptive_size = false,
    width = 30,
    number = false,
    mappings = {
      custom_only = false,
      list = {
      }
    },
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
