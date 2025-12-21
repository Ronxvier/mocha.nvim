# mocha.nvim
**Quality of Life Java features for Neovim**

## Features
* **Allows for Compilation and Execution of Java code using `:Mochacomp`and `:Mocharun`**
* **Autogenerates class definitions and main functions for new Java files**

## Q&A

### Q: How do I install mocha.nvim?
**Lazy.nvim**

```lua
return {
  'Ronxvier/mocha.nvim',
}
```

**packer.nvim**

```lua
use { 'Ronxvier/mocha.nvim' }
```


### Q: What does this plugin do?
* **A:** Right now, all it does is fill in classes and main function definitions for empty java files when you open their buffers, and allow you to compile and execute java code from neovim.

### Q: That code execution stuff sounds useful, how do I use it?
* **A:** You aren't able to use traditional `javac` and `java` commands, because I thought any good neovim plugin needs a learning curve and a level of needless difficulty. Instead, you'll use `:Mochacomp`and `:Mocharun`, or the `:Mochac` and `:Mochar` abbreviations for them. If it was up to me you wouldn't even be able to use the abbreviations, but neovim allows for command abbreviations by default.

### Q: Does it set up a Java LSP for me?
* **A:** No, at least not right now.

### Q: Are there more features planned that justify the creation of a whole plugin for this?
* **A:** No, but the whole reason I made this is because I found myself liking IntelliJ a way too much, so if I find more features in IntelliJ that I like I'll probably try to add those too.

## More Quality of Life

The options below require some more configuration, and I would add these lines to the extension if it didn't mean forcing my fuzzy finder extension onto you, but most editors have some kind of easy sidebar toggle for you to look at when you edit your project. Here's an implementation of that with oil.nvim as the file explorer. The config below uses oil but you could use any file explorer extension (telescope etc.)

```lua
-- oil keybindings

vim.keymap.set("n", "<leader>s", "<cmd>OilToggle<CR>",{desc="toggle oil"})
-- Oil toggle created by kekscode on GitHub
vim.api.nvim_create_user_command("OilToggle", function()
  local current_buf = vim.api.nvim_get_current_buf()
  local current_filetype = vim.api.nvim_buf_get_option(current_buf, "filetype")
  if current_filetype == "oil" then
    -- We use a command to go to the previous buffer
    vim.cmd(":q")
  else
    -- Open oil if not already in an oil buffer
    vim.cmd("vsp")
    vim.cmd("Oil")
  end
end, { nargs = 0 })
```
To use this, just add oil as an extension (stevearc/oil.nvim,) and ad the lines above to your init.lua. The repo has some premade configuration options for oil that you should definitely also steal.
