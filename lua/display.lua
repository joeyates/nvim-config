display = {}

function display.register(use)
  use 'navarasu/onedark.nvim'
end

function display.configure()
  -- show a thin vertical line as a cursor
  vim.opt.guicursor = "n-v-c-i:ver25"
  -- Use truecolor
  vim.opt.termguicolors = true

  --[[
  nvim only paints an area that is an exact number of
  characters wide and high. Any space left over
  continues to have the background colour of the terminal.
  If nvim's colour scheme sets a different background colour,
  this results in an unsightly border.
  So, the terminal background coulour must be set to match
  the nvim theme.
  For onedark, check the value of `bg0` for
  the chosen style here:
  https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua
  ]]

  -- https://github.com/navarasu/onedark.nvim
  local onedark = require('onedark')
  onedark.setup {
    -- dark, darker, cool, deep, warm, warmer
    style = 'warmer'
  }
  onedark.load()
end

return display
