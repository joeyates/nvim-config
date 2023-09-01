-- disable mouse
vim.opt.mouse = ''
-- use Space as the 'leader' key
vim.g.mapleader = ' '

-- vim.keymap requires NeoVim 0.7
-- clear search highlighting with <Enter>
vim.keymap.set('n', '<CR>', ':nohlsearch<CR><CR>')
vim.cmd([[
" Don't quit vim when using `:q`, just close the current buffer
:abbreviate q bd
" Handle case errors
:abbreviate Q bd
:abbreviate Qa qa
]])

