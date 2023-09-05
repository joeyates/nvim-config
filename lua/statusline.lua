function statusline()
  -- See `:help statusline`
  local modified = "%m"
  local file_name = "%f"
  local alignment_separator = "%="
  local line = "%l"
  local line_count = "%L"
  local column = "%c"

  return
    modified .. " " .. file_name .. 
    alignment_separator ..
    "%{&filetype}" ..
    alignment_separator ..
    " (" .. line .. "/" .. line_count .. ":" .. column .. ") "
end

vim.opt.statusline = "%!v:lua.statusline()"
