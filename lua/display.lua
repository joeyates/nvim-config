-- show a thin vertical line as a cursor
vim.opt.guicursor = "n-v-c-i:ver25"
-- Use truecolor
vim.opt.termguicolors = true

require('neosolarized').setup({
  comment_italics = true,
  background_set = true
})
