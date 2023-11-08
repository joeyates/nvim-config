display = {}

local set_buffer_colorscheme = function(ev)
  if vim.bo.filetype == 'elixir' then
    vim.cmd.colorscheme('elixir-hex-pm')
  else
    vim.cmd.colorscheme('kanagawa')
  end
end

function display.register(use)
  -- use a treesitter-compatible colorscheme
  use 'rebelot/kanagawa.nvim'
end

function display.configure()
  -- show a thin vertical line as a cursor
  vim.opt.guicursor = "n-v-c-i:ver25"
  -- Use truecolor
  vim.opt.termguicolors = true
  -- Highlight the line containing the cursor
  vim.opt.cursorline = true
  vim.cmd.colorscheme('kanagawa')

  --[[
  nvim only paints an area that is an exact number of
  characters wide and high. Any space left over
  continues to have the background colour of the terminal.
  If nvim's colour scheme sets a different background colour,
  this results in an unsightly border.
  So, the terminal background colour must be set to match
  the nvim theme.
  ]]

  vim.api.nvim_create_autocmd(
    {'BufEnter'},
    {callback = set_buffer_colorscheme}
  )
end

return display
