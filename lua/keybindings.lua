vim.g.mapleader = ' '       -- use Space as the 'leader' key

-- vim.keymap requires NeoVim 0.7
vim.keymap.set('n', '<Leader>f', ':CtrlP<CR>')
vim.keymap.set('n', '<Leader>p', ':bprevious<CR>')
vim.keymap.set('n', '<Leader><Left>', ':bprevious<CR>')
vim.keymap.set('n', '<Leader>n', ':bNext<CR>')
vim.keymap.set('n', '<Leader><Right>', ':bNext<CR>')
vim.cmd([[
:abbreviate q bd            " Don't quit vim when using `:q`, just close the current buffer
]])
