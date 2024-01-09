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
    -- show text
    ls.parser.parse_snippet(
      'p',
      'IO.puts(\"$1\")$0'
    ),
    -- inspect a variable's value, then show its name
    ls.parser.parse_snippet(
      'pi',
      'IO.inspect($1, label: \"$1\")$0'
    ),
    -- inspect a variable's value, then show a message and the variable's name
    ls.parser.parse_snippet(
      'pmi',
      'IO.inspect($2, label: \"$1: $2\")$0'
    ),
    -- show a message, then a variable's name, then its value
    ls.parser.parse_snippet(
      'pmv',
      'IO.puts(\"$1, $2: #{$2}\")$0'
    ),
    -- insert a breakpoint
    ls.parser.parse_snippet(
      'pry',
      'require IEx; IEx.pry()'
    ),
    -- show a variable's name and value
    ls.parser.parse_snippet(
      'pv',
      'IO.puts(\"$1: #{$1}\")$0'
    )
  })

  ls.add_snippets('heex', {
    -- inspect a variable
    ls.parser.parse_snippet(
      'pi',
      [[<pre>
<%= inspect($1) %>$0
</pre>]]
    ),
  })

  ls.add_snippets('javascript', {
    -- show a variable's name and value
    ls.parser.parse_snippet(
      'pv',
      'console.log(\'$1\', $1)$0'
    )
  })

  ls.add_snippets('typescript', {
    -- print some text
    ls.parser.parse_snippet(
      'p',
      'console.log(\'$1\')$0'
    ),
    -- show a variable's name and value
    ls.parser.parse_snippet(
      'pv',
      'console.log(\'$1\', $1)$0'
    )
  })

  ls.add_snippets('lua', {
    -- print text
    ls.parser.parse_snippet(
      'p',
      'print("$1")$0'
    ),
    -- print a variable name and value
    ls.parser.parse_snippet(
      'pv',
      'print(\"$1: \" .. ${1})$0'
    )
  })

  ls.add_snippets('ruby', {
    -- print text
    ls.parser.parse_snippet(
      'p',
      'puts "$1"$0'
    ),
    -- print a variable's name and inspect its value
    ls.parser.parse_snippet(
      'pi',
      'puts "$1: #{$1.inspect}"$0'
    ),
    -- print a message, then a variable's name and inspect its value
    ls.parser.parse_snippet(
      'pmi',
      'puts "$1, $2: #{$2.inspect}"$0'
    ),
    -- start interactive debugger
    ls.parser.parse_snippet(
      'pry',
      'require "pry-byebug"; binding.pry'
    ),
    -- print a message, then a variable's name and value
    ls.parser.parse_snippet(
      'pmv',
      'puts "$1, $2: #{$2}"$0'
    ),
    -- print a variable's name and value
    ls.parser.parse_snippet(
      'pv',
      'puts "$1: #{$1}"$0'
    ),
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
