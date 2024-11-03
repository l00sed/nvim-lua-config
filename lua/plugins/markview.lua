local headings = {
  enable = true,
  shift_width = 0,
  heading_1 = {
    style = "label",
    padding_left = " 󰉫 ─ ",
    padding_left_hl = "MarkviewHeading1",
    padding_right = "   ",
    padding_right_hl = "MarkviewHeading1",
    icon = "",
    sign = ""
  },
  heading_2 = {
    style = "label",
    padding_left = "▍ 󰉬 ─ ",
    padding_left_hl = "MarkviewHeading2",
    padding_right = "   ",
    padding_right_hl = "MarkviewHeading2",
    icon = "",
    sign = ""
  },
  heading_3 = {
    style = "label",
    padding_left = "▌ 󰉭 ─ ",
    padding_left_hl = "MarkviewHeading3",
    padding_right = "   ",
    padding_right_hl = "MarkviewHeading3",
    icon = "",
    sign = ""
  },
  heading_4 = {
    style = "label",
    padding_left = "▋ 󰉮 ─ ",
    padding_left_hl = "MarkviewHeading4",
    padding_right = "   ",
    padding_right_hl = "MarkviewHeading4",
    icon = "",
    sign = ""
  },
  heading_5 = {
    style = "label",
    padding_left = "▊ 󰉯 ─ ",
    padding_left_hl = "MarkviewHeading5",
    padding_right = "   ",
    padding_right_hl = "MarkviewHeading5",
    icon = "",
    sign = ""
  },
  heading_6 = {
    style = "label",
    padding_left = "▉ 󰉰 ─ ",
    padding_left_hl = "MarkviewHeading6",
    padding_right = "    ",
    padding_right_hl = "MarkviewHeading6",
    icon = "",
    sign = ""
  }
}

local code_blocks = {
  enable = true,
  icons = "devicons",
  style = "language",
  hl = "MarkviewCode",
  info_hl = "MarkviewCodeInfo",
  min_width = 40,
  pad_amount = 3,
  pad_char = " ",
  language_names = nil,
  language_direction = "right",
  sign = false,
  sign_hl = nil
}

horizontal_rules = {
  enable = true,
  parts = {
    {
      type = "repeating",
      --- Amount of time to repeat the text
      --- Can be an integer or a function.
      --- If the value is a function the "buffer" ID
      --- is provided as the parameter.
      ---@type integer | fun(buffer: integer): nil
      repeat_amount = function (buffer)
        local textoff = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1].textoff;
        return math.floor((vim.o.columns - textoff - 3) / 2);
      end,
      --- Text to repeat.
      ---@type string
      text = "─",
      --- Highlight group for this part.
      --- Can be a string(for solid color) or a
      --- list of string(for gradient)
      ---@type string[] | string
      hl = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent7",
        "IndentBlanklineIndent9",
        "IndentBlanklineIndent11",
        "IndentBlanklineIndent13",
        "IndentBlanklineIndent15",
        "IndentBlanklineIndent17",
        "IndentBlanklineIndent20"
      },
      --- Placement direction of the gradient.
      ---@type "left" | "right"
      direction = "left"
    },
    {
      type = "text",
      text = "─",
      ---@type string?
      hl = "IndentBlanklineIndent23"
    },
    {
      type = "repeating",
      --- Amount of time to repeat the text
      --- Can be an integer or a function.
      --- If the value is a function the "buffer" ID
      --- is provided as the parameter.
      ---@type integer | fun(buffer: integer): nil
      repeat_amount = function (buffer)
        local textoff = vim.fn.getwininfo(vim.api.nvim_get_current_win())[1].textoff;
        return math.floor((vim.o.columns - textoff - 3) / 2);
      end,
      --- Text to repeat.
      ---@type string
      text = "─",
      --- Highlight group for this part.
      --- Can be a string(for solid color) or a
      --- list of string(for gradient)
      ---@type string[] | string
      hl = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent7",
        "IndentBlanklineIndent9",
        "IndentBlanklineIndent11",
        "IndentBlanklineIndent13",
        "IndentBlanklineIndent15",
        "IndentBlanklineIndent17",
        "IndentBlanklineIndent20"
      },
      --- Placement direction of the gradient.
      ---@type "left" | "right"
      direction = "right"
    }
  }
}

local opts = {
  -- Buffer types to ignore
  buf_ignore = { "nofile" },
  -- Delay, in miliseconds
  -- to wait before a redraw occurs(after an event is triggered)
  debounce = 50,
  -- Filetypes where the plugin is enabled
  filetypes = { "markdown", "quarto", "rmd", "mdx" },
  -- Highlight groups to use
  -- "dynamic" | "light" | "dark"
  highlight_groups = "dynamic",
  -- Modes where hybrid mode is enabled
  hybrid_modes = nil,
  -- Tree-sitter query injections
  injections = {},
  -- Initial plugin state,
  -- true = show preview
  -- falss = don't show preview
  initial_state = true,
  -- Max file size that is rendered entirely
  max_file_length = 1000,
  -- Modes where preview is shown
  modes = { "n", "no", "c" },
  -- Lines from the cursor to draw when the
  -- file is too big
  render_distance = 100,
  -- Window configuration for split view
  split_conf = {},

  -- Rendering related configuration
  block_quotes = {},
  callbacks = {},
  checkboxes = {},
  code_blocks = code_blocks,
  escaped = {},
  footnotes = {},
  headings = headings,
  horizontal_rules = horizontal_rules,
  html = {},
  inline_codes = {},
  latex = {},
  links = {},
  list_items = {},
  tables = {}
}

require("markview").setup(opts)
