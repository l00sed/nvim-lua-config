# Neovim Configs

This [Neovim](https://github.com/neovim/neovim) configuration is written mostly in Lua. It uses an absurd amount of plugins (~65 when written), but the load time is quick enough for my daily use. The configs might change week-to-week as I'm testing out new plugins or trying to optimize the existing configuration settings.

![neovim](https://user-images.githubusercontent.com/23065167/216802047-7b190d63-90ab-405a-8bf3-085fe5a65bf7.png)

**Recommended Version**
`>=0.9.4`

These configs are tested with `v0.9.4` and `v0.10.0-dev`.
Using with an older version of Neovim may not support some of the settings that reference newer Vim API capabilities. Very old versions of Neovim will also not support Lua configuration.

**LSP**
Different language servers available through the LSP protocol provide code completion and analysis. It's currently setup to use `mason.nvim` and `null-ls` with a few languages.

This README exists to help remember how to do all these things when setting up a new machine.

## Setting up

In order to install some of the language server functionality, the`npm` (Node Package Manager) should be installed. I using `nvm` (Node Version Manager) to install Node version 18 (LTS).

```bash
nvm install --lts
nvm use --lts
npm --version
```

### Linux

The first step is to install the correct version of Neovim. Many plugins will require version 0.8.3 or above. Follow the installation instructions for the build release on the official GitHub page [https://github.com/neovim/neovim/releases](https://github.com/neovim/neovim/releases). Verify the downloaded archive's checksums match up with those on the release page.


### MacOS

Assuming `brew` is installed, installing Neovim is straight-forward:

```bash
# For stable version
brew install neovim

# for nightly version
brew install --HEAD neovim

# To update
brew reinstall neovim
```

Additionally, you may need to configure the `Option` key to behave like `Alt`. In **iTerm2**, this can be done in `Preferences -> Profiles -> Keys`. Change the left option behaviour to `Esc+`. For **kitty**, you need to set `macos_option_as_alt left` (defualt is no) in the terminal's config file. Restarting the terminal (`Command + Q`, then restart) is required for this to take effect.

## Theme

This configuration repo contains a folder with many different available themes. The `lua/themes.lua` file also contains some specific highlight groups and color definitions. It is generally partial to the `gruvbox` theme (dark). If you'd like to switch the theme, some additional configuration might be necessary. Most importantly, you'd want to change the `lua/plugins.lua` file where the `ellisonleao/gruvbox.nvim` gets installed and configured.

## Which-key

The `folke/which-key.nvim` plugin provides a handy interface for discovering the configured keyboard shortcuts. Try pressing the `<leader>` key (configured to the _Space_ bar) and waiting for the help window to appear. You can then proceed with the next keypress to trigger the mapped function.

The keymaps are designed to be mnemonically intuitive. For example, _Telescope_ shortcuts are all `<leader>f` for "Find", followed by `f` for "File" or `g` for "Live Grep" mode. You can run `<leader>W` (that's a capital-case _W_) to immediately toggle the which-key legend.

Keymaps have many sane defaults related to [Tmux](https://github.com/tmux/tmux/wiki) shortcuts. Pressing `<leader>z` will zoom a Neovim buffer like `<C-b>z` will toggle-zoom a Tmux pane. Similarly, `<leader>%` and `<leader>"` will split Neovim panes vertically and horizontally. The `christoomey/vim-tmux-navigator` plugin also makes navigation across Tmux and Neovim panes seamless.

## Installing the configuration

Clone the repo into Neovim's installation folder (usually `/home/<usr>/.config/nvim`):
```bash
git clone https://github.com/l00sed/neovim-lua-config ~/.config/nvim
```

This will create a folder with the configuration with the following structure is as follows:
```
|- lua
|  |- lsp/
|  |- plugins/
|  |- keymaps.lua
|  |- options.lua
|  |- plugins.lua
|  |- theme.lua
|  \- utils.lua
|- plugin/
\- init.lua
```

This structure is important since Lua will not load files that are not located inside `lua`. The file `init.lua` loads all the modules located inside this folder to set the configuration. Most of the names are self explanatory. The most important file here is `plugins.lua`, which is the module that loads the relevant plugins. Some of the most important plugins are:

1. [**lazy.nvim**](https://github.com/folke/lazy.nvim): Manage plugins.
2. [**nvim-lspconfig**](https://github.com/neovim/nvim-lspconfig): Client for different language servers using the Language Server Protocol (LSP).
3. [**mason.nvim**](https://github.com/williamboman/mason.nvim): Additional LSP installation automation.
4. [**nvim-cmp**](https://github.com/hrsh7th/nvim-cmp): Auto-complete functionality. Recommended by the core Neovim team.
5. [**treesitter**](https://github.com/nvim-treesitter/nvim-treesitter): Syntax highlighting and other functionality.
6. [**nvim-tree.lua**](https://github.com/kyazdani42/nvim-tree.lua): File explorer written in Lua.
7. [**vim-fugitive**] (https://github.com/tpope/vim-fugitive): Plugin for git.
8. [**gitsigns.nvim**](https://github.com/lewis6991/gitsigns.nvim): Git gutter highlighting and hunk management in buffer.
9. [**telescope.nvim**](https://github.com/nvim-telescope/telescope.nvim): Fuzzy finder.
10. [**lualine.nvim**](https://github.com/nvim-lualine/lualine.nvim): A status line written in Lua which is similar to `vim-airline`.
11. [**barbar.nvim**](https://github.com/nvim-lualine/lualine.nvim): A status line written in Lua which is similar to `vim-airline`.

There are some more packages that are dependencies of the ones mentioned above, and some for formatting and theming as well. Refer to the `lua/plugins.lua` file to see how plugins are added, or checkout `folke/lazy.nvim` on GitHub.

Plugin configurations that are simple one-liners have gone in `lua/plugins.lua`. More advanced plugin configurations have their own files inside `lua/plugins/<plugin_name>.lua`.

## Auto-completion

The auto-complete functionality is achieved by using `nvim-cmp` to attach the relevant language servers to the buffers containing code. Most servers only require that the on attach function is specified so that different motions are available. Currently, the common function to attach a server to a buffer is located in `lua/lsp/utils.lua` . It will enable common key mappings for all language servers to display code completion.

The second part is installing the language servers themselves (described below) and enabling them. `:Mason` can be used to hopefully automatically install the desired language server. Other may require manual installation or may use `null-ls`. There is an extra step which involves installing the binaries for these servers, which we describe below.

### Installing the language servers

Binaries for each language servers must be installed from their relevant repo. Most servers are installed using `npm install`, but others like `clangd` and `sumneko` for Lua require more involved procedures. Here is a list of servers and installation methods. These should work both on `bash` and `zsh`.

- **Bash**: bashls

  ```bash
  npm i -g bash-language-server
  ```

- **C/C++**: clangd
  May have to try several versions, but 13 is the latest one. I am using 12 and 9 or 8 should be available.

  ```bash
  sudo apt-get install clangd-13
  ```
  Then we must make it the default clangd (example with clangd-13):
  ```bash
  sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-13 100
  ```

  **NOTE**: On MacOS `clang` is installed through XCode, and you probably don't need to do anything else. You can check this by running `clang --version` from the terminal.

- **Docker**: dockerls

  ```bash
  npm i -g dockerfile-language-server-nodejs
  ```

- **Julia**: julials

  ```bash
  julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer")'
  ```

- **JSON**: jsonls

  ```bash
  npm i -g vscode-langservers-extracted
  ```

- **Lua**: sumneko_lua
  This one is a tricky one as you have to manually clone the repo and then compile it. I did not have any issues, but I did have to install ninja for this, which can be done through `apt install ninja-build`.

  1. First clone:
  ```bash
  git clone https://github.com/sumneko/lua-language-server
  cd lua-language-server
  git submodule update --init --recursive
  ```
  2. Next we manually build the server binaries:
  ```bash
  cd 3rd/luamake
  ./compile/install.sh
  cd ../..
  ./3rd/luamake/luamake rebuild
  ```
  The configuration file in the `lsp` folder for this server should reference these binaries and the root folder of the code. I've set it to `~/.local/share/nvim/site/lsp\_servers/sumneko` there is `sumneko_lua` there which is the Lua module used to hook into this one, be careful no to overwrite.

- **Python**: pyright:

  ```bash
  npm i -g pyright
  ```

- **YAML**: yamlls

  This install requires `yarn` to work

  ```bash
  yarn global add yaml-language-server
  ```

  For MacOS use `brew`:
  ```
  brew install yaml-language-server
  ```

If a module complains about the verion of node being too old (pyright will do this), then run the following:
```bash
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
```
Make sure to use the `-g` on all `npm` installs, otherwise the server won't be found.

### Some further notes

Inline error messages are disabled in the current configuration. They create a lot of clutter. I'm use `lsp_lines`, and it can be toggled with `<leader>l`. This is a `nvim` option related to it's `lsp` interface, not something provided by the servers themselves.

## Web-dev Icons

To visualize fancy icons and separators, a patched font must be installed. [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) has many already patched and offers instructions on how to create new ones. To install a patched font follow these instructions:
1. Head to the [repo](https://github.com/ryanoasis/nerd-fonts) and download the font. I use JetBrainsMono Nerd Font (sometimes configured as `JetBrainsMono NF`.
2. Copy the file to the relevant folder:
  - Linux: `~/.local/share/fonts/`.
  - MacOS: `/Library/Fonts/'`.
3. Change the font in the terminal emulator's settings to the patched font.

### Nerd Fonts with Kitty

If using `kitty` as default terminal, then the procedure above won't work. First, `kitty` does not support non-monospaced fonts due to how it renders text. Second, the fonts cannot be patched. In fact, kitty takes care of patching on it's own which is great. To install the fonts follow the instructions in this [blog](https://erwin.co/kitty-and-nerd-fonts/#symbols), which are straighforward.

TL;DR for `MacOS`:
1. Download and install the fonts and put the file `Symbols-2048-em Nerd Font Complete.tff` (or whatever subset you decide to use) in the `Library/Fonts/` folder for system wide use, or the local variant.
2. If the glyphs aren't displayed by default, then they can be specified manually by following the instructions.
3. Refresh the fonts cache.

## TODO:

LSPs to add:
- LaTex: can use [texlab](https://github.com/latex-lsp/texlab).

Some plugins to try:
- Ranger integration: [Rnvimr](https://github.com/kevinhwang91/rnvimr). Use ranger in a floating buffer instead of as a tiled buffer.
- Using GBrowse with fugitive: [rhubarb.vim](https://github.com/tpope/rhubarb.vim).
- Jupyter on Neovim: [jupytext.vim](https://github.com/mwouts/jupytext), [iron.nvim](https://github.com/hkupty/iron.nvim), [vim-textobj-hydrogen](https://github.com/GCBallesteros/vim-textobj-hydrogen). Check this [blog](https://www.maxwellrules.com/misc/nvim_jupyter.html) for more info.
- Git diff and refactoring in Neovim: [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- Structural search and replace: [ssr.nvim](https://github.com/cshuaimin/ssr.nvim). ssr.nvim parses your search pattern to syntax trees to perform structural searching.

## Attributions

This config was based on a fork of [miltonllera](https://github.com/miltonllera)'s config&mdash; which was, in turn, based heavily on [yashguptaz](https://github.com/yashguptaz/)'s [config](https://github.com/yashguptaz/nvy) and tutorial.

There's now a lot of my own efforts and unique approach to some of the config code. However, I frequently use others' code as an example to optimize and enhance my own configs. Thanks to all the useful configs on GitHub that deserve an acknowledgment and to the great Neovim plugin creators out there.
