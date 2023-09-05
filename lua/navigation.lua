navigation = {}

function navigation.register(use)
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end

function navigation.configure()
  -- https://github.com/nvim-telescope/telescope.nvim
  local telescope = require("telescope")
  local builtin = require('telescope.builtin')
  telescope.setup({
    pickers = {
      find_files = {
        find_command = {
          "find", ".",
          "-name", "_build", "-prune", "-o",
          "-name", "deps", "-prune", "-o",
          "-name", ".git", "-prune", "-o",
          "-type", "f", "-print"
        }
      }
    }
  })
  -- search for files
  vim.keymap.set('n', '<leader>f', builtin.find_files, {})
  vim.keymap.set('n', '<leader>a', builtin.live_grep, {})
  -- cycle through buffers
  vim.keymap.set('n', '<Leader>p', ':bprevious<CR>')
  vim.keymap.set('n', '<Leader><Left>', ':bprevious<CR>')
  vim.keymap.set('n', '<Leader>n', ':bnext<CR>')
  vim.keymap.set('n', '<Leader><Right>', ':bnext<CR>')
end

return navigation
