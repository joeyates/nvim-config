notes = {}

function notes.register(use)
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-neorg/neorg',
    tag = 'v6.1.0',
    run = ':Neorg sync-parsers',
    requires = 'nvim-lua/plenary.nvim'
  }
end

function notes.configure()
  require('neorg').setup {
    load = {
      ['core.defaults'] = {},
      ['core.concealer'] = {},
      ['core.dirman'] = {
        config = {
          workspaces = {
            neorg = '~/til/computer/neovim/plugins/neorg',
            notes = '~/notes'
          }
        }
      },
      ['core.keybinds'] = {
        config = {
          neorg_leader = '<Leader>o'
        }
      }
    }
  }
end

return notes
