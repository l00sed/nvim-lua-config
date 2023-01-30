-- Define commands
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local command = vim.api.nvim_create_user_command
local set_hl = vim.api.nvim_set_hl

-- Underline / Undercurl
cmd [[
if &term =~ 'xterm\|kitty\|alacritty\|tmux'
    let &t_Ts="\e[9m"   " Strikethrough
    let &t_Te="\e[29m"
    let &t_Cs="\e[4:3m" " Undercurl
    let &t_Ce="\e[4:0m"
    let &t_ZH="\e[3m"
    let &t_ZR="\e[23m"
endif
]]

-- Remove trailing whitespaces
-- (if a file requires trailing spaces, exclude its type using the regex)
autocmd('BufWritePre', { pattern = '*', command = [[%s/\s\+$//e]] })

-- Swap folder
command('ListSwap', 'split | enew | r !ls -l ~/.local/share/nvim/swap', { bang = true })
command('CleanSwap', '!rm -rf ~/.local/share/nvim/swap/', { bang = true })

-- Open help tags
command('HelpTags', 'Telescope help_tags', { bang = true })

-- Create ctags
command('MakeCTags', '!ctags -R --exclude=@.ctagsignore .', { bang = true })

