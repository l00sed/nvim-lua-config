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

local code_blocks = {
  enable = true,
  icons = "devicons",
  style = "language",
  border_hl = "MarkviewCode",
  info_hl = "MarkviewCodeInfo",
  min_width = 40,
  pad_amount = 3,
  pad_char = " ",
  language_names = nil,
  language_direction = "right",
  sign = false,
  sign_hl = nil
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

local latex = {
  enable = true,
  --- Bracket conceal configuration.
  --- Shows () in specific cases
  parenthesis = {
    enable = true,
    --- Highlight group for the ()
    ---@type string
    hl = "@punctuation.brackets"
  },
  --- LaTeX blocks renderer
  superscripts = {
    enable = true,
    --- Highlight group for the block
    ---@type string
    hl = "MarkviewLatexSuperscript",
    --- Virtual text to show on the bottom
    --- right.
    --- First value is the text and second value
    --- is the highlight group.
    ---@type string[]
    text = { " LaTeX ", "Special" }
  },
  --- Configuration for inline LaTeX maths
  inlines = {
    enable = true
  },
  --- Configuration for operators(e.g. "\frac{1}{2}")
  commands = {
    enable = true,
    configs = {
      sin = {
        --- Configuration for the extmark added
        --- to the name of the operator(e.g. "\sin").
        ---
        --- see `nvim_buf_set_extmark()` for all the
        --- options.
        ---@type table
        operator = {
            conceal = "",
            virt_text = { { "𝚜𝚒𝚗", "Special" } }
        },
        --- Configuration for the arguments of this
        --- operator.
        --- Item index is used to apply the configuration
        --- to a specific argument
        ---@type table[]
        args = {
          {
            --- Extmarks are only added
            --- if a config for it exists.
            --- Configuration for the extmark
            --- added before this argument.
            ---
            --- see `nvim_buf_set_extmark` for more.
            before = {},
            --- Configuration for the extmark
            --- added after this argument.
            ---
            --- see `nvim_buf_set_extmark` for more.
            after = {},
            --- Configuration for the extmark
            --- added to the range of text of
            --- this argument.
            ---
            --- see `nvim_buf_set_extmark` for more.
            scope = {}
          }
        }
      }
    }
  },
  --- Configuration for LaTeX symbols.
  symbols = {
    enable = true,
    --- Highlight group for the symbols.
    ---@type string?
    hl = "@operator.latex"
  },
  subscripts = {
    enable = true,
    hl = "MarkviewLatexSubscript"
  }
}

local opts = {
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
    headings = headings,
    horizontal_rules = horizontal_rules
  },
  experimental = {
    check_rtp = false
  },
  -- Highlight groups to use
  -- "dynamic" | "light" | "dark"
  highlight_groups = "dynamic",
  -- Modes where hybrid mode is enabled
  hybrid_modes = nil,
  -- Rendering related configuration
  block_quotes = {},
  checkboxes = {},
  code_blocks = code_blocks,
  escaped = {},
  footnotes = {},
  html = {},
  inline_codes = {},
  latex = latex,
  links = {},
}

require("markview").setup(opts)

vim.api.nvim_create_autocmd("User", {
	pattern = "MarkviewAttach",
  callback = function ()
    vim.opt_local.number = false
  end
})
