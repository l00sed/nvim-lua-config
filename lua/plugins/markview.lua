local headings = {
  enable = true,
  shift_width = 0,
  heading_1 = {
    style = "label",
    padding_left = " 󰉫 ─ ",
    padding_left_hl = "MarkviewHeading1",
    padding_right = "  ",
    padding_right_hl = "MarkviewHeading1",
    icon = "",
    sign = ""
  },
  heading_2 = {
    style = "label",
    padding_left = " 󰉬 ─ ",
    padding_left_hl = "MarkviewHeading2",
    padding_right = "  ",
    padding_right_hl = "MarkviewHeading2",
    icon = "",
    sign = ""
  },
  heading_3 = {
    style = "label",
    padding_left = " 󰉭 ─ ",
    padding_left_hl = "MarkviewHeading3",
    padding_right = "  ",
    padding_right_hl = "MarkviewHeading3",
    icon = "",
    sign = ""
  },
  heading_4 = {
    style = "label",
    padding_left = " 󰉮 ─ ",
    padding_left_hl = "MarkviewHeading4",
    padding_right = "  ",
    padding_right_hl = "MarkviewHeading4",
    icon = "",
    sign = ""
  },
  heading_5 = {
    style = "label",
    padding_left = " 󰉯 ─ ",
    padding_left_hl = "MarkviewHeading5",
    padding_right = "  ",
    padding_right_hl = "MarkviewHeading5",
    icon = "",
    sign = ""
  },
  heading_6 = {
    style = "label",
    padding_left = " 󰉰 ─ ",
    padding_left_hl = "MarkviewHeading6",
    padding_right = "  ",
    padding_right_hl = "MarkviewHeading6",
    icon = "",
    sign = ""
  }
}

local horizontal_rules = {
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
  experimental = {
    check_rtp_message = false,
  },
  preview = {
    -- Initial plugin state,
    -- true = show preview
    -- false = don't show preview
    enable = true,
    -- Buffer types to ignored
    ignore_buftypes = {},
    -- Delay, in miliseconds
    -- to wait before a redraw occurs(after an event is triggered)
    debounce = 50,
    -- Filetypes where the plugin is enabled
    filetypes = {
      "markdown",
      "quarto",
      "rmd",
      "mdx",
      "latex",
      "codecompanion"
    },
    -- Max file size that is rendered entirely
    max_buf_lines = 1000,
    -- Modes where preview is shown
    modes = { "n", "no", "c" },
    -- Lines from the cursor to draw when the
    -- file is too big
    draw_range = 100,
  },
  markdown = {
    enable = true,
    block_quotes = {},
    code_blocks = {
      enable = true,
      border_hl = "MarkviewCode",
      info_hl = "MarkviewCodeInfo",
      label_direction = "right",
      min_width = 40,
      pad_amount = 2,
      pad_char = " ",
      sign = false,
      sign_hl = nil,
      style = "block",
      language_names = nil
    },
    headings = headings,
    horizontal_rules = horizontal_rules,
    list_items = {},
    tables = {},
    metadata_plus = {},
    metadata_minus = {},
    reference_definitions = {}
  },
  markdown_inline = {},
  -- Highlight groups to use
  -- "dynamic" | "light" | "dark"
  highlight_groups = "dynamic",
  -- Modes where hybrid mode is enabled
  hybrid_modes = nil,
}

require("markview").setup(opts)

vim.api.nvim_create_autocmd("User", {
	pattern = "MarkviewAttach",
  callback = function ()
    vim.opt_local.number = false
  end
})
