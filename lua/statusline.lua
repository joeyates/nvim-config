local function statusline()
  -- See `:help statusline`
  local modified = "%m"
  local file_name = "%f"
  local alignment_separator = "%="
  local line = "%l"
  local column = "%c"

  return
    modified .. " " .. file_name .. 
    alignment_separator ..
    "%{&filetype}" ..
    alignment_separator ..
    " (" .. line .. ":" .. column .. ") "
end

vim.opt.statusline = statusline()
