-- Path mapping: translate host paths to container paths
local function opencode_path_map(host_path)
  local cwd = vim.fn.getcwd()
  -- Replace host project directory with container mount point
  return host_path:gsub(vim.pesc(cwd), '/app')
end

-- Spawn command: start Docker container with opencode server
local function opencode_spawn_command(port, url)
  local dir_name = string.lower(vim.fn.fnamemodify(vim.fn.getcwd(), ":t"))
  local cwd = vim.fn.getcwd()
  local container_name = string.format('opencode-%s', dir_name)

  -- Check if container is already running
  local check_cmd = string.format('docker ps --filter "name=%s" --format "{{.Names}}"', container_name)
  local handle = io.popen(check_cmd)
  local result = handle and handle:read("*a")
  if handle then handle:close() end

  if result and result:match(container_name) then
    print(string.format("[opencode.nvim] Container %s is already running, skipping start", container_name))
    return true
  end

  -- First, try to stop any existing container with the same name
  os.execute(string.format('docker stop %s 2>/dev/null || true', container_name))

  local cmd = string.format([[
docker run -d --rm \
--name %s \
-p %d:4096 \
-v ~/.local/state/opencode:/home/node/.local/state/opencode \
-v ~/.local/share/opencode:/home/node/.local/share/opencode \
-v ~/.config/opencode:/home/node/.config/opencode \
-v "%s":/app:rw \
opencode:latest opencode serve --port 4096 --hostname '0.0.0.0']],
    container_name,
    port,
    cwd
  )

  print(string.format("[opencode.nvim] Starting OpenCode container: %s on port %d", container_name, port))
  return os.execute(cmd)
end

-- Kill command: stop Docker container when auto_kill is triggered
local function opencode_kill_command(port, url)
  local dir_name = string.lower(vim.fn.fnamemodify(vim.fn.getcwd(), ":t"))
  local container_name = string.format('opencode-%s', dir_name)

  print(string.format("[opencode.nvim] Stopping OpenCode container: %s", container_name))
  return os.execute(string.format('docker stop %s 2>/dev/null', container_name))
end

-- Default configuration with all available options
require('opencode').setup({
  preferred_picker = 'telescope', -- 'telescope', 'fzf', 'mini.pick', 'snacks', 'select', if nil, it will use the best available picker. Note mini.pick does not support multiple selections
  preferred_completion = 'nvim-cmp', -- 'blink', 'nvim-cmp','vim_complete' if nil, it will use the best available completion
  default_global_keymaps = false, -- If false, disables all default global keymaps
  default_mode = 'plan', -- 'build' or 'plan' or any custom configured. @see [OpenCode Agents](https://opencode.ai/docs/modes/)
  default_system_prompt = nil, -- Custom system prompt to use for all sessions. If nil, uses the default built-in system prompt
  keymap_prefix = '<leader>o', -- Default keymap prefix for global keymaps change to your preferred prefix and it will be applied to all keymaps starting with <leader>o
  opencode_executable = 'opencode', -- Name of your opencode binary
  -- Custom server configuration (NEW structure)
  server = {
    url = 'localhost',
    port = 'auto',  -- Random port for project isolation
    --path_map = opencode_path_map,
    --spawn_command = opencode_spawn_command,
    --kill_command = opencode_kill_command,
    auto_kill = true,  -- Enable automatic cleanup when last nvim exits
  },
  keymap = {
    editor = {
      ['<leader>og'] = { 'toggle' }, -- Open opencode. Close if opened
      ['<leader>oi'] = { 'open_input' }, -- Opens and focuses on input window on insert mode
      ['<leader>oI'] = { 'open_input_new_session' }, -- Opens and focuses on input window on insert mode. Creates a new session
      ['<leader>oo'] = { 'open_output' }, -- Opens and focuses on output window
      ['<leader>ot'] = { 'toggle_focus' }, -- Toggle focus between opencode and last window
      ['<leader>oT'] = { 'timeline' }, -- Display timeline picker to navigate/undo/redo/fork messages
      ['<leader>oq'] = { 'close' }, -- Close UI windows
      ['<leader>os'] = { 'select_session' }, -- Select and load a opencode session
      ['<leader>oR'] = { 'rename_session' }, -- Rename current session
      ['<leader>op'] = { 'configure_provider' }, -- Quick provider and model switch from predefined list
      ['<leader>oV'] = { 'configure_variant' }, -- Switch model variant for the current model
      --['<leader>oy'] = { 'add_visual_selection', mode = {'v'} },
      ['<leader>oz'] = { 'toggle_zoom' }, -- Zoom in/out on the Opencode windows
      ['<leader>ov'] = { 'paste_image'}, -- Paste image from clipboard into current session
      ['<leader>od'] = { 'diff_open' }, -- Opens a diff tab of a modified file since the last opencode prompt
      ['<leader>o]'] = { 'diff_next' }, -- Navigate to next file diff
      ['<leader>o['] = { 'diff_prev' }, -- Navigate to previous file diff
      ['<leader>oc'] = { 'diff_close' }, -- Close diff view tab and return to normal editing
      ['<leader>ora'] = { 'diff_revert_all_last_prompt' }, -- Revert all file changes since the last opencode prompt
      ['<leader>ort'] = { 'diff_revert_this_last_prompt' }, -- Revert current file changes since the last opencode prompt
      ['<leader>orA'] = { 'diff_revert_all' }, -- Revert all file changes since the last opencode session
      ['<leader>orT'] = { 'diff_revert_this' }, -- Revert current file changes since the last opencode session
      ['<leader>orr'] = { 'diff_restore_snapshot_file' }, -- Restore a file to a restore point
      ['<leader>orR'] = { 'diff_restore_snapshot_all' }, -- Restore all files to a restore point
      ['<leader>ox'] = { 'swap_position' }, -- Swap Opencode pane left/right
      ['<leader>opa'] = { 'permission_accept' }, -- Accept permission request once
      ['<leader>ott'] = { 'toggle_tool_output' }, -- Toggle tools output (diffs, cmd output, etc.)
      ['<leader>otr'] = { 'toggle_reasoning_output' }, -- Toggle reasoning output (thinking steps)
      ['<leader>o/'] = { 'quick_chat', mode = { 'n', 'x' } }, -- Open quick chat input with selection context in visual mode or current line context in normal mode
    },
    input_window = {
      ['<cr>'] = { 'submit_input_prompt', mode = { 'n', 'i' } }, -- Submit prompt (normal mode and insert mode)
      ['<esc>'] = { 'close' }, -- Close UI windows
      ['<C-k>'] = { 'cancel' }, -- Cancel opencode request while it is running
      ['~'] = { 'mention_file', mode = 'i' }, -- Pick a file and add to context. See File Mentions section
      ['@'] = { 'mention', mode = 'i' }, -- Insert mention (file/agent)
      ['/'] = { 'slash_commands', mode = 'i' }, -- Pick a command to run in the input window
      ['#'] = { 'context_items', mode = 'i' }, -- Manage context items (current file, selection, diagnostics, mentioned files)
      ['<M-v>'] = { 'paste_image', mode = 'i' }, -- Paste image from clipboard as attachment
      ['<C-i>'] = { 'focus_input', mode = { 'n' } }, -- Focus on input window and enter insert mode at the end of the input from the output window
      ['<M-k>'] = { 'toggle_pane', mode = { 'n', 'i' } }, -- Toggle between input and output panes
      ['<up>'] = { 'prev_prompt_history', mode = { 'n', 'i' } }, -- Navigate to previous prompt in history
      ['<down>'] = { 'next_prompt_history', mode = { 'n', 'i' } }, -- Navigate to next prompt in history
      ['<tab>'] = { 'switch_mode', mode = { 'n' } }, -- Switch between modes (build/plan)
      ['<M-r>'] = { 'cycle_variant', mode = { 'n', 'i' } }, -- Cycle through available model variants
    },
    output_window = {
      ['<esc>'] = { 'close' }, -- Close UI windows
      ['<C-k>'] = { 'cancel' }, -- Cancel opencode request while it is running
      [']]'] = { 'next_message' }, -- Navigate to next message in the conversation
      ['[['] = { 'prev_message' }, -- Navigate to previous message in the conversation
      ['<tab>'] = { 'toggle_pane', mode = { 'n', 'i' } }, -- Toggle between input and output panes
      ['<C-i>'] = { 'focus_input' }, -- Focus on input window and enter insert mode at the end of the input from the output window
      ['<M-r>'] = { 'cycle_variant', mode = { 'n' } }, -- Cycle through available model variants
      ['<leader>oS'] = { 'select_child_session' }, -- Select and load a child session
      ['<leader>oD'] = { 'debug_message' }, -- Open raw message in new buffer for debugging
      ['<leader>oO'] = { 'debug_output' }, -- Open raw output in new buffer for debugging
      ['<leader>ods'] = { 'debug_session' }, -- Open raw session in new buffer for debugging
    },
    session_picker = {
      rename_session = { '<C-r>' }, -- Rename selected session in the session picker
      delete_session = { '<C-d>' }, -- Delete selected session in the session picker
      new_session = { '<C-s>' }, -- Create and switch to a new session in the session picker
    },
    timeline_picker = {
      undo = { '<C-u>', mode = { 'i', 'n' } }, -- Undo to selected message in timeline picker
      fork = { '<C-f>', mode = { 'i', 'n' } }, -- Fork from selected message in timeline picker
    },
    history_picker = {
      delete_entry = { '<C-d>', mode = { 'i', 'n' } }, -- Delete selected entry in the history picker
      clear_all = { '<C-X>', mode = { 'i', 'n' } }, -- Clear all entries in the history picker
    },
    model_picker = {
      toggle_favorite = { '<C-f>', mode = { 'i', 'n' } },
    },
    mcp_picker = {
      toggle_connection = { '<C-t>', mode = { 'i', 'n' } }, -- Toggle MCP server connection in the MCP picker
    },
  },
  ui = {
    position = 'right', -- 'right' (default), 'left' or 'current'. Position of the UI split. 'current' uses the current window for the output.
    input_position = 'bottom', -- 'bottom' (default) or 'top'. Position of the input window
    window_width = 0.40, -- Width as percentage of editor width
    zoom_width = 0.8, -- Zoom width as percentage of editor width
    display_model = true, -- Display model name on top winbar
    display_context_size = true, -- Display context size in the footer
    display_cost = true, -- Display cost in the footer
    window_highlight = 'Normal:OpencodeBackground,FloatBorder:OpencodeBorder', -- Highlight group for the opencode window
    icons = {
      preset = 'nerdfonts', -- 'nerdfonts' | 'text'. Choose UI icon style (default: 'nerdfonts')
      overrides = { -- Optional per-key overrides, see section below
        header_user = '>',
        --header_assistant = '▌',
        header_assistant = '󰙴 ',
        snapshot = ' ',
        edit = '󰲶 ',
        run = ' ',
        task = '󰄴 ',
        read = ' ',
        write = ' ',
        plan = ' ',
        search = ' ',
        web = '󰖟 ',
        list = ' ',
        tool = '󰖷 ',
        restore_point = '󰒋 ',
        restore_count = ' ',
        file = '󰈙 ',
        status_on = ' ',
        status_off = ' ',
        border = '▌ ',
        bullet = '∙',
      }
    },
    output = {
      tools = {
        show_output = true, -- Show tools output [diffs, cmd output, etc.] (default: true)
        show_reasoning_output = true, -- Show reasoning/thinking steps output (default: true)
      },
      rendering = {
        markdown_debounce_ms = 250, -- Debounce time for markdown rendering on new data (default: 250ms)
        on_data_rendered = nil, -- Called when new data is rendered; set to false to disable default RenderMarkdown/Markview behavior
      },
    },
    input = {
      min_height = 0.10, -- min height of prompt input as percentage of window height
      max_height = 0.25, -- max height of prompt input as percentage of window height
      text = {
        wrap = false, -- Wraps text inside input window
      },
      -- Auto-hide input window when prompt is submitted or focus switches to output window
      auto_hide = false,
    },
    picker = {
      snacks_layout = nil -- `layout` opts to pass to Snacks.picker.pick({ layout = ... })
    },
    completion = {
      file_sources = {
        enabled = true,
        preferred_cli_tool = 'rg', -- 'fd','fdfind','rg','git','server' if nil, it will use the best available tool, 'server' uses opencode cli to get file list (works cross platform) and supports folders
        ignore_patterns = {
          '^%.git/',
          '^%.svn/',
          '^%.hg/',
          'node_modules/',
          '%.pyc$',
          '%.o$',
          '%.obj$',
          '%.exe$',
          '%.dll$',
          '%.so$',
          '%.dylib$',
          '%.class$',
          '%.jar$',
          '%.war$',
          '%.ear$',
          'target/',
          'build/',
          'dist/',
          'out/',
          'deps/',
          '%.tmp$',
          '%.temp$',
          '%.log$',
          '%.cache$',
        },
        max_files = 10,
        max_display_length = 50, -- Maximum length for file path display in completion, truncates from left with "..."
      },
    },
  },
  context = {
    enabled = true, -- Enable automatic context capturing
    cursor_data = {
      enabled = false, -- Include cursor position and line content in the context
      context_lines = 5, -- Number of lines before and after cursor to include in context
    },
    diagnostics = {
      info = false, -- Include diagnostics info in the context (default to false
      warn = true, -- Include diagnostics warnings in the context
      error = true, -- Include diagnostics errors in the context
      only_closest = false, -- If true, only diagnostics for cursor/selection
    },
    current_file = {
      enabled = true, -- Include current file path and content in the context
      show_full_path = true,
    },
    files = {
      enabled = true,
      show_full_path = true,
    },
    selection = {
      enabled = true, -- Include selected text in the context
    },
    buffer = {
      enabled = false, -- Disable entire buffer context by default, only used in quick chat
    },
    git_diff = {
      enabled = false,
    },
  },
  logging = {
    enabled = true,
    level = 'debug', -- debug, info, warn, error
    outfile = nil,
  },
  debug = {
    enabled = false, -- Enable debug messages in the output window
    capture_streamed_events = false,
    show_ids = true,
    quick_chat = {
      keep_session = false, -- Keep quick_chat sessions for inspection, this can pollute your sessions list
      set_active_session = false,
    },
  },
  prompt_guard = nil, -- Optional function that returns boolean to control when prompts can be sent (see Prompt Guard section)

  -- User Hooks for custom behavior at certain events
  hooks = {
    on_file_edited = nil, -- Called after a file is edited by opencode.
    on_session_loaded = nil, -- Called after a session is loaded.
    on_done_thinking = nil, -- Called when opencode finishes thinking (all jobs complete).
    on_permission_requested = nil, -- Called when a permission request is issued.
  },
  quick_chat = {
    default_model = nil,   -- works better with a fast model like gpt-4.1
    default_agent = 'plan', -- plan ensure no file modifications by default
    instructions = nil, -- Use built-in instructions if nil
  },
})
