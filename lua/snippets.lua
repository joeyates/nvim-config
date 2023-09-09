--[[
-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#snippet_syntax
-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#lsp-snippets

Choices:

```
ls.parser.parse_snippet(
	"mol",
	"The answer is ${2|42,unknown,blowing in the wind|}"
)
```
--]]

snippets = {}

function snippets.register(use)
  use { -- keyb
    'L3MON4D3/LuaSnip',
    run = 'make install_jsregexp'
  }
end

function snippets.configure()
  local ls = require('luasnip')

  ls.add_snippets('elixir', {
    -- pipeline inspect with a label
    ls.parser.parse_snippet(
      '|il',
      '|> IO.inspect(label: \"$1\")$0'
    ),
    ls.parser.parse_snippet(
      'pi',
      'IO.inspect($1, label: \"$2\")$0'
    ),
    ls.parser.parse_snippet(
      'pv',
      'IO.puts(\"$1: #{$1}\")$0'
    )
  })

  ls.add_snippets('lua', {
    -- print a variable name and value
    ls.parser.parse_snippet(
      'pv',
      'print(\"$1: \" .. ${1})$0'
    )
  })

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
end

return snippets
