local function statusline()
  -- See `:help statusline`
  local modified = "%m"
  local file_name = "%f"
  local align_right = "%="
  local line = "%l"
  local column = "%c"
  local filetype = "%y"

  return
    modified .. " " .. file_name .. 
    align_right ..
    " (" .. line .. ":" .. column .. ")" ..
    " " .. filetype .. " "
end

vim.opt.statusline = statusline()
