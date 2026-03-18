# Neovim Config

Personal Neovim config built around Lua, `lazy.nvim`, LSP, and a tmux-friendly workflow.

## Requirements

- Neovim `>= 0.11`
- Git
- A Nerd Font (for icons)
- Optional but recommended: `ripgrep`, `fd`, `node`, `npm`, `python3`

## Install

```bash
git clone https://github.com/l00sed/neovim-lua-config ~/.config/nvim
```

Open Neovim once to let `lazy.nvim` install plugins.

## Structure

- `init.lua`: entrypoint and lazy bootstrapping
- `lua/options.lua`: core editor options
- `lua/commands.lua`: autocommands and user commands
- `lua/keymaps/`: default and plugin keymaps
- `lua/plugins.lua`: plugin specs (load strategy, deps, config entrypoints)
- `lua/plugins/`: plugin-specific setup files

## Startup Performance

Startup has been tuned to reduce eager plugin loading and defer expensive systems until needed.

Profile commands:

```bash
nvim --headless --startuptime /tmp/nvim-startup.log +qa
nvim --headless --clean --startuptime /tmp/nvim-clean.log +qa
```

Useful in-editor commands:

- `:Lazy profile`
- `:Lazy`
- `:checkhealth`

## LSP and Tooling

- `mason.nvim`, `mason-lspconfig.nvim`, and `nvim-lspconfig` handle servers
- `none-ls.nvim` is used for selected formatting/diagnostics sources
- Most server tuning lives in `lua/plugins/mason.lua`

Install Node-based tools with your preferred Node setup (for example `nvm` + `npm i -g ...` where required).

## Notes

- Leader key is `<Space>`
- Many mappings are tmux-aligned (`vim-tmux-navigator`, pane resizing, zoom)
- Theme defaults to gruvbox with extra highlight customization in `lua/themes.lua`

## Attributions

This config started from community Neovim setups and has since been heavily customized.
