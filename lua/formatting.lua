vim.opt.tabstop = 2         -- number of columns occupied by a tab
vim.opt.expandtab = true    -- converts tabs to white space
vim.opt.shiftwidth = 2      -- width for autoindents
vim.opt.autoindent = true   -- indent a new line the same amount as the line just typed
vim.opt.formatoptions:remove("t") -- do not automatically wrap text when typing
vim.cmd([[
set cc=80                   " set an 80 column border for good coding style
set nowrap                  " do not automatically wrap on load
]])

