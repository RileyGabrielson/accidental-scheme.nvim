# accidental-scheme.nvim

![accidental-scheme-cover](https://user-images.githubusercontent.com/65042525/217168433-8a303a74-8432-4bff-964d-40fed03b04fe.jpeg)

A configurable, opinionated colorscheme generator. Heavily influenced by [palenightfall.nvim](https://github.com/JoosepAlviste/palenightfall.nvim).

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
  secondary = "complementary", -- complementary, random, or primary
  highlight_overrides = {},
}
```

For additional details, see `:h accidental-scheme`

## Todo

- [ ] Accent shuffling configuration (the randomizer isn't random enough. Strings are always a variation of green, constants are always a variation of orange)
- [ ] Cohesion configuration (how close should each highlight should be to the primary and secondary colors)
- [ ] Light Mode support
- [ ] Primary/Secondary hex color configuration
