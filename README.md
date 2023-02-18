# accidental-scheme.nvim

![accidental-scheme-cover](https://user-images.githubusercontent.com/65042525/217168433-8a303a74-8432-4bff-964d-40fed03b04fe.jpeg)

A configurable, opinionated colorscheme generator.

Influenced by [palenightfall.nvim](https://github.com/JoosepAlviste/palenightfall.nvim).

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

## Usage

Generate a colorscheme with either `:AccidentalSchemeNew` or `:lua require("accidental-scheme").new_scheme()`.

## Configuration

Accidental Scheme has the following defaults

```lua
{
  secondary = "complementary", -- complementary, random, or primary
  highlight_overrides = {},
  disable_accent_shuffling = false,
  accent_cohesion_factor = 1, -- how close accent colors are to the secondary color
}
```

For additional details, see `:h accidental-scheme`

## Todo

- [x] Accent shuffling configuration (the randomizer isn't random enough. Strings are always a variation of green, constants are always a variation of orange)
- [x] Cohesion configuration (how close should each highlight should be to the primary and secondary colors)
- [ ] Light Mode support
- [ ] Primary/Secondary hex color configuration
