-- Exists to create class templates for empty java files
vim.api.nvim_create_autocmd("BufEnter",{
  callback = function()
    local bufname = vim.fn.expand('%:t')
    local fileType = string.sub(bufname, -5)
    local className = string.sub(bufname,0, -6)
    print(fileType)
    print(bufname)
    if isEmpty() and fileType == ".java" then
      local classDef = {
        "public class " .. className .. " {",
        "    public static void main(String[] args){",
        "    }",
        "}"
      }
      vim.api.nvim_buf_set_lines(0, 0, -1, false, classDef)
    end
  end,
})

function isEmpty()
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  if #lines > 1 or (#lines == 1 and #lines[1] > 0) then
    return false
  else
    return true
    end
end

local bufname = vim.fn.expand('%:t')

-- user functions
vim.api.nvim_create_user_command('Mochacomp', 'term javac ' .. bufname, {})
vim.api.nvim_create_user_command("Mocharun",
function(opts)
  vim.cmd("term java " .. bufname .. " " .. opts.args)
end, {nargs = "*",})

