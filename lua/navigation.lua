navigation = {}

function find_in_buffer_dir()
  local builtin = require('telescope.builtin')
  local utils = require('telescope.utils')
  builtin.find_files({ cwd = utils.buffer_dir() })
end

function grep_string_whole_words()
  local builtin = require('telescope.builtin')
  builtin.grep_string({ word_match = '-w' })
end

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
          '-name', '.elixir_ls', '-prune', '-o',
          '-name', '.git', '-prune', '-o',
          '-name', 'node_modules', '-prune', '-o',
          '-name', 'tmp', '-prune', '-o',
          '-name', 'vendor', '-prune', '-o',
          '-type', 'f', '-print'
        }
      }
    }
  })
  -- search for files
  vim.keymap.set('n', '<leader>f', builtin.find_files, {})
  vim.keymap.set('n', '<leader>F', find_in_buffer_dir, {})
  -- live_grep and grep_string are configured via telescope.setup.vimgrep_arguments
  vim.keymap.set('n', '<leader>a', builtin.live_grep, {})
  -- search for the text under the cursor (including partial matches and case differences)
  vim.keymap.set('n', '<leader>A', builtin.grep_string, {})
  -- search for the symbol under the cursor (as a whole word, with matching case)
  vim.keymap.set('n', '<leader>S', grep_string_whole_words, {})
  -- cycle through buffers
  vim.keymap.set('n', '<Leader>p', ':bprevious<CR>')
  vim.keymap.set('n', '<Leader><Left>', ':bprevious<CR>')
  vim.keymap.set('n', '<Leader>n', ':bnext<CR>')
  vim.keymap.set('n', '<Leader><Right>', ':bnext<CR>')
end

return navigation
