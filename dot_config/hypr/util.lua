util = {}

-- https://github.com/basecamp/omarchy/blob/06e32d243d5c410e2421b9f3db5be3c3ae33d3e2/default/hypr/helpers.lua#L5-L7
function util.shell_quote(value)
  return "'" .. tostring(value):gsub("'", "'\\''") .. "'"
end

-- https://github.com/basecamp/omarchy/blob/06e32d243d5c410e2421b9f3db5be3c3ae33d3e2/default/hypr/helpers.lua#L21-L35
-- Hyprland reaps its own children, so os.execute() can't retrieve an exit status
-- from inside the compositor. Read a marker off stdout instead.
function util.shell_succeeds(command)
  -- Subshell, so the redirection covers every command rather than binding to
  -- the last one and letting an earlier one write its own OK into the pipe.
  local pipe = io.popen("( " .. util.shell_quote(command) .. " ) >/dev/null 2>&1 && echo OK")
  if not pipe then
    return false
  end

  local output = pipe:read("*a") or ""
  pipe:close()

  return output:find("OK", 1, true) ~= nil
end
