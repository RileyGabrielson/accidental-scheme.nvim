# accidental-scheme.nvim

A configurable, opinionated colorscheme generator.

## Features

- Generates balanced colorschemes
- Allows configuration for how schemes are generated

## Installation

Install the plugin with your preferred package manager:

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
require("lazy").setup({
  {
    "rileygabrielson/accidental-scheme.nvim",
    config = function()
      require("accidental-scheme").setup({
        -- your configuration should go here
      })
    end,
  },
})
```

### [packer](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "rileygabrielson/accidental-scheme.nvim",
  config = function()
    require("accidental-scheme").setup {
      -- your configuration should go here
    }
  end
}
```

## Configuration

Accidental Scheme has the following defaults

```lua
{
  secondary: "complementary", -- complementary, random, or primary
  highlight_overrides: {},
}
```

For additional details, see `:h accidental-scheme`
