local actions = require('telescope.actions')
-- local utils = require('telescope.utils')
-- local trouble = require('telescope.providers.telescope')

require('telescope').setup({
  defaults = {
    sorting_strategy = "ascending",
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-c>'] = actions.close,
      },
      n = {
        ['<C-c>'] = actions.close,
      },
    },
    layout_config = {
      horizontal = {
        prompt_position = "top",
      },
      center = {
        width = 1,
        height = function(_, _, max_lines)
          return math.min(max_lines * 0.5, 15)
        end,
      },
      preview_width = 0.55,
    },
    prompt_prefix = "  ",
    horizontal = {
      height = 47,
      prompt_position = "top",
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
  },
})

require('telescope').load_extension('fzf')
