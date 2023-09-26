-- number of columns occupied by a tab
vim.opt.tabstop = 2
-- converts tabs to white space
vim.opt.expandtab = true
-- width for autoindents
vim.opt.shiftwidth = 2
-- indent a new line the same amount as the line just typed
vim.opt.autoindent = true
-- set an 80 column border
vim.opt.colorcolumn = '80'

local set_buffer_formatting_options = function(ev)
  -- :help fo-table
  -- do not automatically wrap text when typing
  vim.opt.formatoptions:remove('t')
  -- do not insert current comment leader after <Enter>
  vim.opt.formatoptions:remove('r')
  -- do not insert current comment leader after 'o' or 'O'
  vim.opt.formatoptions:remove('o')
  -- do not automatically wrap long lines
  vim.opt_local.wrap = false
end

vim.api.nvim_create_autocmd(
  {'BufReadPost', 'BufNewFile'},
  {callback = set_buffer_formatting_options}
)
