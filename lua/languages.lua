languages = {}

function languages.register(use)
  use 'elixir-editors/vim-elixir'
  use 'nvim-treesitter/nvim-treesitter'
end

function languages.configure()
  -- https://neovim.io/doc/user/treesitter.html
  -- Update treesitter parsers
  vim.cmd(':TSUpdate')
  -- https://github.com/nvim-treesitter/nvim-treesitter
  configs = require('nvim-treesitter.configs')
  configs.setup {
    highlight = { enable = true }
  }
end

return languages


