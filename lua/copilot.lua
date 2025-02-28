copilot = {}

function copilot.register(use)
  vim.g.copilot_node_command = "~/.asdf/installs/nodejs/21.6.1/bin/node"
  use {'github/copilot.vim', branch = 'release'}
end

function copilot.configure()
  -- Manual setup:
  -- :Copilot setup
  vim.cmd(':Copilot enable')
end

return copilot



