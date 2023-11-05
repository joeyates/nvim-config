navigation = {}

function navigation.register(use)
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end

function navigation.configure()
  -- https://github.com/nvim-telescope/telescope.nvim
  -- Configuration: https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes
  local telescope = require('telescope')
  local builtin = require('telescope.builtin')
  telescope.setup({
    pickers = {
      find_files = {
        find_command = {
          'find', '.',
          '-name', '_build', '-prune', '-o',
          '-name', '.bundle', '-prune', '-o',
          '-name', 'deps', '-prune', '-o',
          '-name', 'doc', '-prune', '-o',
          '-name', '.git', '-prune', '-o',
          '-name', 'tmp', '-prune', '-o',
          '-name', 'vendor', '-prune', '-o',
          '-type', 'f', '-print'
        }
      }
    }
  })
  -- search for files
  vim.keymap.set('n', '<leader>f', builtin.find_files, {})
  -- live_grep and grep_string are configured via telescope.setup.vimgrep_arguments
  vim.keymap.set('n', '<leader>a', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>A', builtin.grep_string, {})
  -- cycle through buffers
  vim.keymap.set('n', '<Leader>p', ':bprevious<CR>')
  vim.keymap.set('n', '<Leader><Left>', ':bprevious<CR>')
  vim.keymap.set('n', '<Leader>n', ':bnext<CR>')
  vim.keymap.set('n', '<Leader><Right>', ':bnext<CR>')
end

return navigation
