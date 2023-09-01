-- disable mouse
vim.opt.mouse = ''
-- use Space as the 'leader' key
vim.g.mapleader = ' '

-- vim.keymap requires NeoVim 0.7
-- open ctrlp
vim.keymap.set('n', '<Leader>f', ':CtrlP<CR>')
-- cycle through buffers
vim.keymap.set('n', '<Leader>p', ':bprevious<CR>')
vim.keymap.set('n', '<Leader><Left>', ':bprevious<CR>')
vim.keymap.set('n', '<Leader>n', ':bnext<CR>')
vim.keymap.set('n', '<Leader><Right>', ':bnext<CR>')
-- clear search highlighting with <Enter>
vim.keymap.set('n', '<CR>', ':nohlsearch<CR><CR>')
vim.cmd([[
" Don't quit vim when using `:q`, just close the current buffer
:abbreviate q bd
" Handle case errors
:abbreviate Q bd
:abbreviate Qa qa
]])

local ls = require("luasnip")

vim.api.nvim_set_keymap('i', '<Tab>', '', {
  callback = function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end,
  silent = true
})

vim.api.nvim_set_keymap('i', '<S-Tab>', '', {
  callback = function()
    ls.jump(-1)
  end,
  silent = true
})

vim.api.nvim_set_keymap('i', '<C-E>', '', {
  callback = function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end,
  silent = true
})
