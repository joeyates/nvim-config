local ls = require("luasnip")

-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#snippet_syntax
-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#lsp-snippets
--[[

Choices:

```
ls.parser.parse_snippet(
	"mol",
	"The answer is ${2|42,unknown,blowing in the wind|}"
)
```
--]]
ls.add_snippets("elixir", {
  -- pipeline inspect with a label
	ls.parser.parse_snippet(
		"|il",
		"|> IO.inspect(label: \"$1\")$0"
	),
	ls.parser.parse_snippet(
		"pi",
		"IO.inspect($1, label: \"$2\")$0"
	)
})
