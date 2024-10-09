local headings = {
  enable = true,
  shift_width = 0,
  heading_1 = {
    style = "label",
    padding_left = "█ 󰉫 ─ ",
    padding_left_hl = "MarkviewHeading1",
    padding_right = "   ",
    padding_right_hl = "MarkviewHeading1",
    icon = "",
    sign = ""
  },
  heading_2 = {
    style = "label",
    padding_left = "▉ 󰉬 ─ ",
    padding_left_hl = "MarkviewHeading2",
    padding_right = "   ",
    padding_right_hl = "MarkviewHeading2",
    icon = "",
    sign = ""
  },
  heading_3 = {
    style = "label",
    padding_left = "▊ 󰉭 ─ ",
    padding_left_hl = "MarkviewHeading3",
    padding_right = "   ",
    padding_right_hl = "MarkviewHeading3",
    icon = "",
    sign = ""
  },
  heading_4 = {
    style = "label",
    padding_left = "▋ 󰉮 ─ ",
    padding_left_hl = "MarkviewHeading4",
    padding_right = "   ",
    padding_right_hl = "MarkviewHeading4",
    icon = "",
    sign = ""
  },
  heading_5 = {
    style = "label",
    padding_left = "▌ 󰉯 ─ ",
    padding_left_hl = "MarkviewHeading5",
    padding_right = "   ",
    padding_right_hl = "MarkviewHeading5",
    icon = "",
    sign = ""
  },
  heading_6 = {
    style = "label",
    padding_left = "▍ 󰉰 ─ ",
    padding_left_hl = "MarkviewHeading6",
    padding_right = "    ",
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

local opts = {
  -- Buffer types to ignore
  buf_ignore = { "nofile" },
  -- Delay, in miliseconds
  -- to wait before a redraw occurs(after an event is triggered)
  debounce = 50,
  -- Filetypes where the plugin is enabled
  filetypes = { "markdown", "quarto", "rmd" },
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
  horizontal_rules = {},
  html = {},
  inline_codes = {},
  latex = {},
  links = {},
  list_items = {},
  tables = {}
}

require("markview").setup(opts)
