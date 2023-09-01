-- Don't show startup message
vim.opt.shortmess:append('I')
-- disable mouse
vim.opt.mouse = ''
-- use Space as the 'leader' key
vim.g.mapleader = ' '

require('session').setup()
require('formatting')
require('search')
require('command-aliases')
require('statusline')

-- Nothing above this line must depend on plugins

require('plugins').install({
  register = function(use)
    -- This function registers all packages to be installed
    require('languages').register(use)
    require('navigation').register(use)
    require('display').register(use)
    require('snippets').register(use)
  end,
  configure = function()
    -- This function is called after all packages have been installed
    require('languages').configure()
    require('navigation').configure()
    require('display').configure()
    require('snippets').configure()
  end
})
