local set_colour = function(colour)
  vim.api.nvim_command(
    string.format(
      "highlight %s guifg=%s guibg=%s guisp=%s gui=%s",
      colour.name,
      colour.fg or "none",
      colour.bg or "none",
      colour.sp or "none",
      colour.fmt or "none"
    )
  )
end

-- Source of colours:
-- https://github.com/elixir-lang/ex_doc/blob/6645809b2c4434221a2005b22646ad55ea2db069/assets/css/makeup.css#L89

-- In nvim, get syntax color name under cursor:
--   :echo synIDattr(synIDtrans(synID(line("."), col("."), 1)), "name")
-- List all colours:
--   :highlight

-- # TODO
-- Parser:
--   `|>` is parsed as 'Statement' but should be 'PreProc'

-- hexdocs background colour is #081221, we use a colour 3% lighter
local background = "#0a1629"
set_colour({name = "Normal", bg = background}) -- Set default background color
set_colour({name = "Comment", fg = "#969386"}) -- Elixir: # comment
set_colour({name = "Constant", fg = "#e6db74"}) -- Elixir: atom
set_colour({name = "Define", fg = "#66d9ef"}) -- Elixir: 'defmodule'
set_colour({name = "Identifier", fg = "#a6e22e"}) -- Elixir: function name
set_colour({name = "PreProc", fg = "#ff5385"}) -- Elixir: `alias`, `use`
set_colour({name = "Title", fg = "#000080", bg = "#a6a6a6", fmt = "bold"}) -- Markdown: header1
set_colour({name = "Type", fg = "#a6e22e"}) -- Elixir: module name
set_colour({name = "Statement", fg = "#66d9ef"}) -- Elixir: `|>`, HTML tags in ~H()
set_colour({name = "Special", fg = "#e6db74"}) -- Elixir: double quotes, sigils
set_colour({name = "elixirArguments", fg = "#dce1e6"}) -- Elixir: argument
set_colour({name = "elixirId", fg = "#dce1e6"}) -- Elixir: function name
set_colour({name = "elixirTupleDelimiter", fg = "#dce1e6"}) -- Elixir: `{}`
set_colour({name = "elixirListDelimiter", fg = "#dce1e6"}) -- Elixir: `[]`
-- Added to hexdocs theme
set_colour({name = "NonText", fg = background}) -- Hide the `~` tilde characters after the end of file
set_colour({name = "Search", fg = background, bg = "#969386"}) -- Search highlight colour
set_colour({name = "Cursorline", bg = "#1a2639"}) -- Highlight the cursor line
