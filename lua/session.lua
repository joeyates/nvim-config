local session = {}

local session_file = function()
  return vim.fn.getcwd() .. '/.session.nvim'
end

session.save = function()
  local file = session_file()
  vim.cmd('mksession! ' .. file)
end

local restore = function()
  local file = session_file()
  local exists = vim.fn.filereadable(file)
  if exists ~= 0 then
    print('loading session ' .. file)
    vim.cmd('source ' .. file)
  end
end

session.setup = function()
  -- Restore window position
  vim.opt.sessionoptions:append('winpos')
  -- Restore window size
  vim.opt.sessionoptions:remove('resize')
  -- Don't save options
  vim.opt.sessionoptions:remove('options')
  -- Don't reload help buffers
  vim.opt.sessionoptions:remove('help')
  -- Don't reload blank buffers
  vim.opt.sessionoptions:remove('blank')

  vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
      restore()
    end,
    nested = true
  })

  vim.api.nvim_create_autocmd('VimLeave', {
    callback = function()
      save()
    end
  })
end

return session
