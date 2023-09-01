-- Don't show startup message
vim.opt.shortmess:append("I")

require('session').setup()
require('formatting')

-- Nothing above this line must depend on plugins

require('plugins').install({
  register = function(use)
    -- This function registers all packages to be installed
    require('languages').register(use)
    use 'ctrlpvim/ctrlp.vim'
    use 'navarasu/onedark.nvim'
    use {
      'L3MON4D3/LuaSnip',
      run = "make install_jsregexp"
    }
  end,
  configure = function()
    -- This function is called after all packages have been installed
    require('languages').configure()
    require('display')
    require('snippets')
    require('keybindings')
    require('statusline')

    vim.cmd([[
      let g:ctrlp_custom_ignore = 'deps'
    ]])
  end
})
