local packages = require('packages')

packages.ensure_packer()

require('packer').startup(function(use)
  packages.install(use)
end)

vim.api.nvim_create_autocmd(
  "User", {
    pattern = "PackerComplete",
    callback = function(ev)
      packages.setup()
    end
  }
)

require('packer').install()
