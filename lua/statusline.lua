function statusline()
  -- See `:help statusline`
  local file_name = "%f"
  local alignment_separator = "%="
  local line = "%l"
  local line_count = "%L"
  local column = "%c"

  local getbufinfo = vim.fn['getbufinfo']
  local current = vim.api.nvim_get_current_buf()
  local info = getbufinfo(current)
  local modified_marker = ""
  if info[1]["changed"] == 1 then
    modified_marker = "*"
  end

  return
    file_name .. modified_marker ..
    alignment_separator ..
    "%{&filetype}" ..
    alignment_separator ..
    " (" .. line .. "/" .. line_count .. ":" .. column .. ") "
end

vim.opt.statusline = "%!v:lua.statusline()"
