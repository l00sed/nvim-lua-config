require('barbecue').setup({
  create_autocmd = false,
  theme = {
    normal = { bg = 'None' },
  },
  symbols = {
    separator = ''
    --separator = ''
    --separator = ''
    --separator = ''
    --separator = ''
  },
  kinds = {
    File = "",
    Module = "",
    Namespace = "",
    Package = "󰏗",
    Class = "󰒕",
    Method = "󰚺",
    Property = "󰬗",
    Field = "󰧉",
    Constructor = "󰬊",
    Enum = "󱓿",
    Interface = "󰈀",
    Function = "󰊕",
    Variable = "󰅗",
    Constant = "󰐀",
    String = "󱀍",
    Number = "󰎠",
    Boolean = "󱎖",
    Array = "󰅨",
    Object = "󱃖",
    Key = "󰌋",
    Null = "󰚌",
    EnumMember = "󱗜",
    Struct = "󰅳",
    Event = "󰛂",
    Operator = "󰪚",
    TypeParameter = "󰅱",
  }
})

vim.api.nvim_create_autocmd({
  "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",
  -- include this if you have set `show_modified` to `true`
  "BufModifiedSet",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end
})

