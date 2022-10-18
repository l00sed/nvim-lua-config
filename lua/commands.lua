-- Define commands
local cmd = vim.cmd

-- Underline / Undercurl
cmd [[
if &term =~ 'xterm\|kitty\|alacritty\|tmux'
    let &t_Ts = "\e[9m"   " Strikethrough
    let &t_Te = "\e[29m"
    let &t_Cs = "\e[4:3m" " Undercurl
    let &t_Ce = "\e[4:0m"
endif
]]

-- Remove trailing whitespaces
-- (if a file requires trailing spaces, exclude its type using the regex)
cmd [[autocmd BufWritePre * %s/\s\+$//e ]]

-- Swap folder
cmd('command! ListSwap split | enew | r !ls -l ~/.local/share/nvim/swap')
cmd('command! CleanSwap !rm -rf ~/.local/share/nvim/swap/')

-- Open help tags
cmd("command! HelpTags Telescope help_tags")

-- Create ctags
cmd('command! MakeCTags !ctags -R --exclude=@.ctagsignore .')

