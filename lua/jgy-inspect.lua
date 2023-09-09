function inspect(v, options)
  top = false
  if not options then
    options = {seen = {}}
    top = true
  end
  t = type(v)
  if t == 'number' then
    io.write(v)
  elseif t == 'string' then
    io.write("'" .. v .. "'")
  elseif t == 'table' then
    id = tostring(v)
    if options.seen[id] then
      io.write('(' .. id .. '...)')
    else
      options.seen[id] = true
      first = true
      io.write('{')
      for k, v in pairs(v) do
        if first then
          first = false
        else
          io.write(', ')
        end
        inspect(k, options)
        io.write(' = ')
        inspect(v, options)
      end
    end
    io.write('}')
  else
    error('inspect() - unexpected type: ' .. t)
  end
  -- print a newline after the end of top-level inspect
  if top then
    print('')
  end
end

