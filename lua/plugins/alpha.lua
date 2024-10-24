-- Make sure alpha exists before calling it
local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end
-- Make sure lazy exists
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- Alias vim cmd
local cmd = vim.cmd

-- Use the "startify" theme
local startify = require("alpha.themes.startify")
-- Programmer quotes
local wizard = require("plugins.wizardsay")

local stats = require("lazy").stats()
local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
local lazystats = "Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"

-- Get plugins details
plugins = require("lazy").stats()

-- Use devicons
startify.file_icons.provider = "devicons"

-- Set header
startify.section.header.val = wizard.wizardsays()

-- disable folding, wrapping in alpha
cmd [[au FileType alpha setl nofen nowrap breakindent]]

startify.section.top_buttons.val = {
	startify.button("e", "<empty buffer>", ":ene <BAR> startinsert <CR>"),
  { type = "padding", val = 1 },
  { type = "text", val = "Shortcuts", opts = { hl = "SpecialComment", shrink_margin = false } },
  { type = "padding", val = 1 },
	startify.button("f", "Search Filename", ":Tel escope find_files <CR>"),
	startify.button("b", "Bookmarks", ":Telescope  marks <CR>"),
	startify.button("t", "Search Text", ":Telesco pe live_grep <CR>"),
	startify.button("r", "Recent", ":Telescope ol dfiles <CR>"),
}

startify.section.mru_cwd.val = {
  { type = "padding", val = 1 },
  { type = "text", val = "MRU", opts = { hl = "SpecialComment", shrink_margin = false } },
  { type = "padding", val = 1 },
  {
    type = "group",
    val = function()
      return { startify.mru(0) }
    end
  }
}

startify.section.mru.val = {
  { type = "padding", val = 1 },
  { type = "text", val = "MRU " .. vim.fn.getcwd(), opts = { hl = "SpecialComment", shrink_margin = false } },
  { type = "padding", val = 1 },
  {
    type = "group",
    val = function()
      return { startify.mru(10, vim.fn.getcwd()) }
    end,
    opts = { shrink_margin = false },
  }
}

startify.section.bottom_buttons.val = {
  startify.button("p", "  Plugins", ":e ~/.config/nvim/lua/plugins.lua<CR>"),
	startify.button("c", "  Config", ":e ~/.config/nvim/lua/options.lua<CR>"),
	startify.button("q", " 󰈆 Quit", ":q <CR>"),
}

--startify.section.footer.val = lazystats

require("alpha").setup(startify.config)
