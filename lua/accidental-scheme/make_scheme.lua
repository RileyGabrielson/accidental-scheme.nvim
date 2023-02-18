local rgb_utils = require("accidental-scheme.rgb_utils")
local generate_colors = require("accidental-scheme.generate_colors")
local make_highlights = require("accidental-scheme.make_highlights")

local function make_scheme(options)
  local primary = rgb_utils.random_rgb_color();
  local secondary = rgb_utils.complementary_rgb(primary)

  if options.secondary == "random" then
    secondary = rgb_utils.random_rgb_color();
  elseif options.secondary == "primary" then
    secondary = primary;
  end

  local colors = generate_colors.generate_colors(primary, secondary, options.constant_accents, options.accent_cohesion_factor);
  make_highlights.highlight_colors(colors, options.highlight_overrides);
end

return make_scheme;

