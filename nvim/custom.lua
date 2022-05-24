
function os.capture(cmd)
  lines = {}

  -- local f = assert(io.popen(cmd, 'r'))
  
  -- for _s in f:lines() do
  --   table.insert(lines, _s)
  -- end
  -- f:close()

  -- get a temporary file name
  n = os.tmpname ()

  -- execute a command
  os.execute (cmd .. " > " .. n)

  -- display output
  for line in io.lines (n) do
    table.insert(lines, line)
  end

  -- remove temporary file
  os.remove (n)

  return lines
end

local function create_win(txt)
  -- We save handle to window from which we open the navigation
  start_win = vim.api.nvim_get_current_win()

  vim.api.nvim_command('botright vnew') -- We open a new vertical window at the far right
  win = vim.api.nvim_get_current_win() -- We save our navigation window handle...
  buf = vim.api.nvim_get_current_buf() -- ...and it's buffer handle.

  -- We should name our buffer. All buffers in vim must have unique names.
  -- The easiest solution will be adding buffer handle to it
  -- because it is already unique and it's just a number.
  vim.api.nvim_buf_set_name(buf, 'Oldfiles #' .. buf)

  -- Now we set some options for our buffer.
  -- nofile prevent mark buffer as modified so we never get warnings about not saved changes.
  -- Also some plugins treat nofile buffers different.
  -- For example coc.nvim don't triggers aoutcompletation for these.
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  -- We do not need swapfile for this buffer.
  vim.api.nvim_buf_set_option(buf, 'swapfile', false)
  -- And we would rather prefer that this buffer will be destroyed when hide.
  -- vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  -- It's not necessary but it is good practice to set custom filetype.
  -- This allows users to create their own autocommand or colorschemes on filetype.
  -- and prevent collisions with other plugins.
  vim.api.nvim_buf_set_option(buf, 'filetype', 'nvim-oldfile')

  -- For better UX we will turn off line wrap and turn on current line highlight.
  vim.api.nvim_win_set_option(win, 'wrap', false)
  vim.api.nvim_win_set_option(win, 'cursorline', true)

  vim.api.nvim_buf_set_lines(buf, 0, 0, false, txt)
  -- set_mappings() -- At end we will set mappings for our navigation.
end

function Try(cmd)
  local val = os.capture(cmd)
  create_win(val)
end
