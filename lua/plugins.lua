plugins = {}

-- Packages are installed under ~/.local/share/nvim/site/pack/packer/start

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

function plugins.install(arg)
  ensure_packer()

  vim.api.nvim_create_autocmd(
  "User", {
    pattern = "PackerComplete",
    callback = function(ev)
      arg.configure()
    end
  })

  local packer = require('packer')
  packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    arg.register(use)
  end)
  packer.install()
end

return plugins
