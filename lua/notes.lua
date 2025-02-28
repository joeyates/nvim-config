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
  -- Override colorscheme to make links blue
  vim.api.nvim_command("highlight @neorg.links.location.url guifg=#5050d0")
  vim.api.nvim_command("highlight @neorg.anchors.declaration.norg guifg=#5050d0")
end

return notes
