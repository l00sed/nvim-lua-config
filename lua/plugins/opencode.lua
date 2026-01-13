require('opencode').setup({
  preferred_picker = 'telescope', -- 'telescope', 'fzf', 'mini.pick', 'snacks', if nil, it will use the best available picker. Note mini.pick does not support multiple selections
  preferred_completion = 'nvim-cmp', -- 'blink', 'nvim-cmp','vim_complete' if nil, it will use the best available completion
  default_global_keymaps = false, -- If false, disables all default global keymaps
  default_mode = 'plan', -- 'build' or 'plan' or any custom configured. @see [OpenCode Agents](https://opencode.ai/docs/modes/)
  keymap = {
    editor = {
      ['<leader>og'] = { 'toggle' }, -- Open opencode. Close if opened
      ['<leader>oi'] = { 'open_input' }, -- Opens and focuses on input window on insert mode
      ['<leader>oI'] = { 'open_input_new_session' }, -- Opens and focuses on input window on insert mode. Creates a new session
      ['<leader>oo'] = { 'open_output' }, -- Opens and focuses on output window
      ['<leader>ot'] = { 'toggle_focus' }, -- Toggle focus between opencode and last window
      ['<leader>oq'] = { 'close' }, -- Close UI windows
      ['<leader>os'] = { 'select_session' }, -- Select and load a opencode session
      ['<leader>op'] = { 'configure_provider' }, -- Quick provider and model switch from predefined list
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
      ['<leader>opA'] = { 'permission_accept_all' }, -- Accept all (for current tool)
      ['<leader>opd'] = { 'permission_deny' }, -- Deny permission request once
    },
    input_window = {
      ['<cr>'] = { 'submit_input_prompt', mode = { 'n', 'i' } }, -- Submit prompt (normal mode and insert mode)
      ['<esc>'] = { 'close' }, -- Close UI windows
      ['<C-c>'] = { 'stop' }, -- Stop opencode while it is running
      ['~'] = { 'mention_file', mode = 'i' }, -- Pick a file and add to context. See File Mentions section
      ['@'] = { 'mention', mode = 'i' }, -- Insert mention (file/agent)
      ['/'] = { 'slash_commands', mode = 'i' }, -- Pick a command to run in the input window
      ['<M-k>'] = { 'toggle_pane', mode = { 'n', 'i' } }, -- Toggle between input and output panes
      ['<up>'] = { 'prev_prompt_history', mode = { 'n', 'i' } }, -- Navigate to previous prompt in history
      ['<down>'] = { 'next_prompt_history', mode = { 'n', 'i' } }, -- Navigate to next prompt in history
      ['<tab>'] = { 'switch_mode' }, -- Switch between modes (build/plan)
    },
    output_window = {
      ['<esc>'] = { 'close' }, -- Close UI windows
      ['<C-c>'] = { 'stop' }, -- Stop opencode while it is running
      [']]'] = { 'next_message' }, -- Navigate to next message in the conversation
      ['[['] = { 'prev_message' }, -- Navigate to previous message in the conversation
      ['<tab>'] = { 'toggle_pane', mode = { 'n', 'i' } }, -- Toggle between input and output panes
      ['<C-i>'] = { 'focus_input' }, -- Focus on input window and enter insert mode at the end of the input from the output window
      ['<leader>oS'] = { 'select_child_session' }, -- Select and load a child session
      ['<leader>oD'] = { 'debug_message' }, -- Open raw message in new buffer for debugging
      ['<leader>oO'] = { 'debug_output' }, -- Open raw output in new buffer for debugging
      ['<leader>ods'] = { 'debug_session' }, -- Open raw session in new buffer for debugging
    }
  },
  ui = {
    position = 'right', -- 'right' (default) or 'left'. Position of the UI split
    input_position = 'bottom', -- 'bottom' (default) or 'top'. Position of the input window
    window_width = 0.40, -- Width as percentage of editor width
    input_height = 0.15, -- Input height as percentage of window height
    display_model = true, -- Display model name on top winbar
    display_context_size = true, -- Display context size in the footer
    display_cost = true, -- Display cost in the footer
    window_highlight = 'Normal:OpencodeBackground,FloatBorder:OpencodeBorder', -- Highlight group for the opencode window
    icons = {
      preset = 'nerdfonts', -- 'emoji' | 'text'. Choose UI icon style (default: 'emoji')
      overrides = {
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
      },
    },
    input = {
      text = {
        wrap = false, -- Wraps text inside input window
      },
    },
    completion = {
      file_sources = {
        enabled = true,
        preferred_cli_tool = 'fd', -- 'fd','fdfind','rg','git' if nil, it will use the best available tool
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
    },
    diagnostics = {
      info = false, -- Include diagnostics info in the context (default to false
      warn = true, -- Include diagnostics warnings in the context
      error = true, -- Include diagnostics errors in the context
    },
    current_file = {
      enabled = true, -- Include current file path and content in the context
    },
    selection = {
      enabled = true, -- Include selected text in the context
    },
  },
  debug = {
    enabled = false, -- Enable debug messages in the output window
  },
})
