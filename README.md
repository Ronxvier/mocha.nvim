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
