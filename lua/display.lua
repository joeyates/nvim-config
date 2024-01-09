display = {}

local elixir_options = function(_ev)
  vim.cmd.colorscheme('elixir-hex-pm')
end

local markdown_options = function(_ev)
  vim.cmd.colorscheme('kanagawa')
end

local norg_options = function(_ev)
  vim.o.conceallevel = 2
end

local filetype_options = {
  elixir = elixir_options,
  markdown = markdown_options,
  norg = norg_options
}

local set_filetype_display_options = function(ev)
  options = filetype_options[vim.bo.filetype]
  if options then
    options(ev)
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
  vim.o.conceallevel = 0

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
    {callback = set_filetype_display_options}
  )
end

return display
