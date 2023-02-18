local rgb_utils = require('accidental-scheme.rgb_utils')
local base_colors = rgb_utils.get_base_colors();
local accents = require('accidental-scheme.accents')

local M = {}

function M.get_off_base_colors(secondary, accent_cohesion_factor)
  local colors = {
    orange = rgb_utils.combine_rgb(secondary, 2 * accent_cohesion_factor, base_colors.orange, 3);
    yellow = rgb_utils.combine_rgb(secondary, 2 * accent_cohesion_factor, base_colors.yellow, 3);
    green = rgb_utils.combine_rgb(secondary, 1 * accent_cohesion_factor, base_colors.green, 1);
    cyan = rgb_utils.combine_rgb(secondary, 1 * accent_cohesion_factor, base_colors.cyan, 1);
    blue = rgb_utils.combine_rgb(
      rgb_utils.combine_rgb(secondary, 2 * accent_cohesion_factor, base_colors.blue, 3),
      1,
      base_colors.white,
      1
    );
    purple = rgb_utils.combine_rgb(
      rgb_utils.combine_rgb(secondary, 2 * accent_cohesion_factor, base_colors.purple, 3),
      1,
      base_colors.white,
      1
    );
    violet = rgb_utils.combine_rgb(secondary, 1 * accent_cohesion_factor, base_colors.violet, 3);
    red = rgb_utils.combine_rgb(secondary, 3 * accent_cohesion_factor, base_colors.red, 3);
    pink = rgb_utils.combine_rgb(secondary, 1 * accent_cohesion_factor, base_colors.pink, 3);
  };
  return colors;
end

function M.get_combination_colors(background, foreground, secondary, off_base_colors, accent_cohesion_factor)
  local colors = {
    red_dark = rgb_utils.combine_rgb(off_base_colors.red, 10, background, 6);
    orange_dark = rgb_utils.combine_rgb(off_base_colors.orange, 10, background, 6);
    green_dark = rgb_utils.combine_rgb(off_base_colors.green, 10, background, 6);

    background_darker = rgb_utils.combine_rgb(background, 1, base_colors.black, 2);
    foreground_darker = rgb_utils.combine_rgb(foreground, 1, base_colors.black, 1);
    selection = rgb_utils.combine_rgb(secondary, 3 * accent_cohesion_factor, background, 4);
    highlight = rgb_utils.combine_rgb(secondary, 3 * accent_cohesion_factor, background, 2);
    references = rgb_utils.combine_rgb(secondary, 1 * accent_cohesion_factor, background, 10);

    diff_add_background = rgb_utils.combine_rgb(off_base_colors.green, 1, background, 7);
    diff_add_highlight = rgb_utils.combine_rgb(off_base_colors.green, 1, background, 2);
    diff_delete_background = rgb_utils.combine_rgb(off_base_colors.red, 1, background, 5);
    diff_delete_highlight = rgb_utils.combine_rgb(off_base_colors.red, 1, background, 2);
  }

  return colors;
end

function M.generate_colors(primary, secondary, constant_accents, accent_cohesion_factor)
  local off_base_colors = M.get_off_base_colors(secondary, accent_cohesion_factor);
  local background = rgb_utils.combine_rgb(primary, 1, base_colors.black, 6);
  local foreground = rgb_utils.combine_rgb(primary, 1, base_colors.white, 8);
  local combination_colors = M.get_combination_colors(
    background,
    foreground,
    secondary,
    off_base_colors, 
    accent_cohesion_factor
  );
  local accent_colors = accents.get_accents(off_base_colors, constant_accents);

  local colors = {
    background = rgb_utils.rgb_to_hex(background),
    foreground = rgb_utils.rgb_to_hex(foreground),
    primary = rgb_utils.rgb_to_hex(primary),
    secondary = rgb_utils.rgb_to_hex(secondary),
    brown = rgb_utils.rgb_to_hex(rgb_utils.combine_rgb(secondary, 1 * accent_cohesion_factor, base_colors.brown, 3));
  }
  for key, value in pairs(off_base_colors) do colors[key] = rgb_utils.rgb_to_hex(value) end;
  for key, value in pairs(combination_colors) do colors[key] = rgb_utils.rgb_to_hex(value) end;
  for key, value in pairs(accent_colors) do colors[key] = rgb_utils.rgb_to_hex(value) end;

  return colors;
end

return M;

