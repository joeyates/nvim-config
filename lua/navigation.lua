navigation = {}

function navigation.register(use)
  use 'ctrlpvim/ctrlp.vim'
end

function navigation.configure()
  vim.cmd([[
    let g:ctrlp_custom_ignore = 'deps'
  ]])
  -- open ctrlp
  vim.keymap.set('n', '<Leader>f', ':CtrlP<CR>')
  -- cycle through buffers
  vim.keymap.set('n', '<Leader>p', ':bprevious<CR>')
  vim.keymap.set('n', '<Leader><Left>', ':bprevious<CR>')
  vim.keymap.set('n', '<Leader>n', ':bnext<CR>')
  vim.keymap.set('n', '<Leader><Right>', ':bnext<CR>')
end

return navigation
