local cmd = vim.cmd
-- Lualine configuration
local non_language_ft = {
  'Startify',
  'NVimTree',
}

local gruvbox = function()
  local colors = { -- Gruvbox Dark
    darkgray = "#282828",
    gray = "#928374",
    innerbg = nil,
    outerbg = "#1d2021",
    normal = "#458487",
    insert = "#689c69",
    visual = "#cb231d",
    replace = "#d69821",
    command = "#98961a",
  }

  return {
    inactive = {
      a = { fg = colors.gray, bg = colors.outerbg, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    visual = {
      a = { fg = colors.darkgray, bg = colors.visual, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    replace = {
      a = { fg = colors.darkgray, bg = colors.replace, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    normal = {
      a = { fg = colors.darkgray, bg = colors.normal, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    insert = {
      a = { fg = colors.darkgray, bg = colors.insert, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
    command = {
      a = { fg = colors.darkgray, bg = colors.command, gui = "bold" },
      b = { fg = colors.gray, bg = colors.outerbg },
      c = { fg = colors.gray, bg = colors.innerbg },
    },
  }
end

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = gruvbox(),
    -- Separators might look weird for certain fonts (eg Cascadia)
    component_separators = { left = '', right = '' },
    --section_separators = {
    --  left = ' ',
    --  right = ''
    --},
    section_separators = {
      left = '',
      right = ''
    }, -- BubbleButt
    disabled_filetypes = {
      statusline = {
        'packer',
        'NvimTree',
      },
      winbar = {
        'packer',
        'NvimTree',
      },
    },
    globalstatus = true,
  },
  sections = {
    --lualine_a = {'mode'},
    lualine_a = { -- BubbleButt
      { 'mode', separator = {
        left = '',
        right = ''
      }, right_padding = 0 },
    },
    lualine_b = { 'branch', 'diff' },
    lualine_c = {
      'filetype',
      {
        function()
          local msg = 'No LSP'
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()

          if next(clients) == nil  then
            return msg
          end

          -- Check for utility buffers
          for ft in non_language_ft do
            if ft:match(buf_ft) then
              return ''
            end
          end

          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes

            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              -- return 'LSP:'..client.name  -- Return LSP name
              return ''  -- Only display if no LSP is found
            end
          end

          return msg
        end,
        color = { fg = '#ffffff', gui = 'bold' },
        separator = "",
      },
      {
        'diagnostics',
        sources = {'nvim_diagnostic'},
        sections = {'error', 'warn', 'info'},
      },
    },
    lualine_x = { 'encoding' },
    lualine_y = { 'progress' },
    lualine_z = {
      { function () return '' end },
      --{'location'},
      { 'location', separator = {
        right = ''
      }, left_padding = 0 }, -- BubbleButt
    }
  },
})
