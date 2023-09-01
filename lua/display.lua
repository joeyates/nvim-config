-- show a thin vertical line as a cursor
vim.opt.guicursor = "n-v-c-i:ver25"
-- Use truecolor
vim.opt.termguicolors = true

-- https://github.com/navarasu/onedark.nvim
local onedark = require('onedark')
onedark.setup {
  -- dark, darker, cool, deep, warm, warmer
  style = 'warmer'
}
onedark.load()
