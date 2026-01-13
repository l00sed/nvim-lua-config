-- This function has been generated from your
--   view.mappings.list
--   view.mappings.custom_only
--   remove_keymaps
--
-- You should add this function to your configuration and set on_attach = on_attach in the nvim-tree setup call.
--
-- Although care was taken to ensure correctness and completeness, your review is required.
--
-- Please check for the following issues in auto generated content:
--   "Mappings removed" is as you expect
--   "Mappings migrated" are correct
--
-- Please see https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach for assistance in migrating.

local api = require('nvim-tree.api')

-- Override the default delete mechanism with "trash-cli"
-- to allow restoration if files are accidentally deleted
local function nvim_tree_trash()
  local node = api.tree.get_node_under_cursor()
  local trash_cmd = "trash "

  local function get_user_input_char()
    local c = vim.fn.getchar()
    return vim.fn.nr2char(c)
  end

  print("trash " .. node.name .. "? y/n")

  if (get_user_input_char():match('^y') and node) then
    vim.fn.jobstart(trash_cmd .. node.absolute_path, {
      detach = true,
      on_exit = function (job_id, data, event) api.tree.reload() end,
    })
  end

  vim.api.nvim_command('normal :esc<CR>')
end

local on_attach = function(bufnr)
  local opts = function()
    return { desc='nvim-tree', buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Default mappings. Feel free to modify or remove as you wish.
  -- BEGIN_DEFAULT_ON_ATTACH
  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'), {
    silent = true, desc = 'Change root to selected node.'
  })
  vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer,     opts('Open: In Place'), {
    silent = true, desc = 'Open, replacing the NvimTree buffer.'
  })
  vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'), {
    silent = true, desc = 'Rename, omitting filename.'
  })
  vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'), {
    silent = true, desc = 'Open in a new tab.'
  })
  vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'), {
    silent = true, desc = 'Open in a new vertical split.'
  })
  vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'), {
    silent = true, desc = 'Open in a new horizontal split.'
  })
  vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'), {
    silent = true, desc = "Close the selected node's parent directory."
  })
  vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'), {
    silent = true, desc = 'Open the selected file.'
  })
  vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'), {
    silent = true, desc = 'Open the selected file in preview mode.'
  })
  vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'), {
    silent = true, desc = "Navigate to the selected node's next sibling."
  })
  vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'), {
    silent = true, desc = "Navigate to the selected node's previous sibling."
  })
  vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'), {
    silent = true, desc = 'Run command.'
  })
  vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'), {
    silent = true, desc = 'Change root to parent.'
  })
  vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'), {
    silent = true, desc = 'Create.'
  })
  vim.keymap.set('n', 'bmv',   api.marks.bulk.move,                   opts('Move Bookmarked'), {
    silent = true, desc = 'Bulk move.'
  })
  vim.keymap.set('n', 'B',     api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'), {
    silent = true, desc = 'Toggle no buffer.'
  })
  vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'), {
    silent = true, desc = 'Copy mode.'
  })
  vim.keymap.set('n', 'C',     api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'), {
    silent = true, desc = 'Toggle git clean.'
  })
  vim.keymap.set('n', '[c',    api.node.navigate.git.prev,            opts('Prev Git'), {
    silent = true, desc = 'Navigate to the previous git change.'
  })
  vim.keymap.set('n', ']c',    api.node.navigate.git.next,            opts('Next Git'), {
    silent = true, desc = 'Navigate to the next git change.'
  })
  vim.keymap.set('n', 'd',     nvim_tree_trash,                       opts('Delete'), {
    silent = true, desc = 'Delete.'
  })
  vim.keymap.set('n', 'D',     api.fs.trash,                          opts('Trash'), {
    silent = true, desc = 'Trash.'
  })
  vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'), {
    silent = true, desc = 'Expand all.'
  })
  vim.keymap.set('n', 'e',     api.fs.rename_basename,                opts('Rename: Basename'), {
    silent = true, desc = 'Rename base.'
  })
  vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'), {
    silent = true, desc = 'Navigate by diagnostics (next).'
  })
  vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'), {
    silent = true, desc = 'Navigate by diagnostics (previous).'
  })
  vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'), {
    silent = true, desc = 'Clear the filter.'
  })
  vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'), {
    silent = true, desc = 'Activate the filter.'
  })
  vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'), {
    silent = true, desc = 'Toggle NvimTree help options.'
  })
  vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'), {
    silent = true, desc = "Copy the selected node's absolute path."
  })
  vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'), {
    silent = true, desc = 'Toggle hidden files (dotfiles).'
  })
  vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'), {
    silent = true, desc = 'Toggle hiding any files marked by a .gitignore file.'
  })
  vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'), {
    silent = true, desc = "Navigate to the selected node's last sibling."
  })
  vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'), {
    silent = true, desc = "Navigate to the selected node's first sibling."
  })
  vim.keymap.set('n', 'm',     api.marks.toggle,                      opts('Toggle Bookmark'), {
    silent = true, desc = 'Toggle mark.'
  })
  vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'), {
    silent = true, desc = 'Open/Edit'
  })
  vim.keymap.set('n', 'O',     api.node.open.no_window_picker,        opts('Open: No Window Picker'), {
    silent = true, desc = 'Open (no window picker)'
  })
  vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'), {
    silent = true, desc = 'Paste'
  })
  vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'), {
    silent = true, desc = 'Navigate to parent directory.'
  })
  vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'), {
    silent = true, desc = 'Close the selected tree.'
  })
  vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'), {
    silent = true, desc = 'Rename the selected node.'
  })
  vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'), {
    silent = true, desc = 'Reload NvimTree.'
  })
  vim.keymap.set('n', 's',     api.node.run.system,                   opts('Run System'), {
    silent = true, desc = "Open in system's file browser."
  })
  vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'), {
    silent = true, desc = 'Search'
  })
  vim.keymap.set('n', 'U',     api.tree.toggle_custom_filter,         opts('Toggle Hidden'), {
    silent = true, desc = 'Toggle custom filter.'
  })
  vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'), {
    silent = true, desc = 'Collapse all.'
  })
  vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'), {
    silent = true, desc = 'Cut'
  })
  vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'), {
    silent = true, desc = 'Copy filename.'
  })
  vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'), {
    silent = true, desc = 'Copy relative path.'
  })
  vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'), {
    silent = true, desc = 'Open with left mouse button.'
  })
  vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'), {
    silent = true, desc = 'CD with right mouse button.'
  })
  -- END_DEFAULT_ON_ATTACH

  -- Mappings removed via:
  --   remove_keymaps
  --   OR
  --   view.mappings.list..action = ""
  --
  -- The dummy set before del is done for safety, in case a default mapping does not exist.
  -- You might tidy things by removing these along with their default mapping.
  -- -- Using this mapping for resizing panes
  vim.keymap.set('n', '<C-k>', '', { buffer = bufnr })
  vim.keymap.del('n', '<C-k>', { buffer = bufnr })

  -- Mappings migrated from view.mappings.list
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'), {
    silent = true, desc = 'Open the selected file.'
  })
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'), {
    silent = true, desc = 'Close directory, or parent directory when selecting a file.'
  })
  vim.keymap.set('n', 'H', api.tree.collapse_all, opts('Collapse'), {
    silent = true, desc = 'Collapse all directories recursively.'
  })
  vim.keymap.set('n', 'i', api.node.show_info_popup, opts('Info'), {
    silent = true, desc = 'Get file info.'
  })
  -- Git
  -- -- Git Add
  vim.keymap.set('n', 'ga', function()
    local node = api.tree.get_node_under_cursor()

    local function git_add(node)
      local gs = node.git_status.file

      -- If the file is untracked, unstaged or partially staged, we stage it
      if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
        vim.cmd("silent !git add " .. node.absolute_path)
      -- If the file is staged, we unstage it
      elseif gs == "M " or gs == "A " then
        vim.cmd("silent !git restore --staged " .. node.absolute_path)
      end

      api.tree.reload()
    end

    git_add(node)
  end, opts(), { silent = true, desc = 'Git "add" the selected file.' })
  -- -- Git Restore
  vim.keymap.set('n', 'gr', function()
    local node = api.tree.get_node_under_cursor()

    local function git_restore(node)
      local gs = node.git_status.file
      -- If the file is modified, we restore it
      vim.cmd("silent !git restore " .. node.absolute_path)

      api.tree.reload()
    end

    git_restore(node)
  end, opts(), { silent = true, desc = 'Git "restore" the selected file.' })
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
  api.tree.open()
end

--vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

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
    timeout = 600,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  on_attach = on_attach,
})
