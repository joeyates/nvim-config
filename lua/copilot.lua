copilot = {}

function copilot.register(use)
  use {'github/copilot.vim', branch = 'release'}
end

function copilot.configure()
  -- Manual setup:
  -- :Copilot setup
  vim.cmd(':Copilot enable')
end

return copilot



