-- number of columns occupied by a tab
vim.opt.tabstop = 2
-- converts tabs to white space
vim.opt.expandtab = true
-- width for autoindents
vim.opt.shiftwidth = 2
-- indent a new line the same amount as the line just typed
vim.opt.autoindent = true
-- do not automatically wrap text when typing
vim.opt.formatoptions:remove("t")
vim.cmd([[
" set an 80 column border for good coding style
set cc=80
" do not automatically wrap on load
set nowrap
]])

