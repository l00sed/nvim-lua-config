-- Define commands
local cmd = vim.cmd

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
