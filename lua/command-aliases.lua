vim.cmd([[
  " Don't quit vim when using `:q`, just close the current buffer
  :abbreviate q bd
  " Handle case errors
  :abbreviate Q bd
  :abbreviate Qa qa
]])

