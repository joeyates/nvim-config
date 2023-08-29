-- Don't show startup message
vim.opt.shortmess:append("I")

-- Nothing above this line must depend on plugins

require('plugins').install({
  register = function(use)
    -- This function registers all packages to be installed
    use 'wbthomason/packer.nvim'
    use 'ctrlpvim/ctrlp.vim'
    use 'elixir-editors/vim-elixir'
    use {
      'svrana/neosolarized.nvim',
      requires = {{'tjdevries/colorbuddy.nvim'}}
    }
    use {
      'L3MON4D3/LuaSnip',
      run = "make install_jsregexp"
    }
  end,
  complete = function()
    -- This function is called after all packages have been installed
    require('formatting')
    require('display')
    require('keybindings')
  end
})
