packages = {}

-- Packages are installed under ~/.local/share/nvim/site/pack/packer/start

function packages.ensure_packer()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

function packages.install(use)
  -- This function lists all packages to be installed 
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
end

function packages.setup()
  -- This function is called after all packages have been installed
  require('neosolarized').setup({
    comment_italics = true,
    background_set = true
  })
end

return packages
