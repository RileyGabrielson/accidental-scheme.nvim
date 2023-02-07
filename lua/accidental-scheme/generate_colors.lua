local rgb_utils = require('accidental-scheme.rgb_utils')
local base_colors = rgb_utils.get_base_colors();

local function get_off_base_colors(secondary)
  local colors = {
    red = rgb_utils.combine_rgb(secondary, 3, base_colors.red, 3);
    orange = rgb_utils.combine_rgb(secondary, 2, base_colors.orange, 3);
    yellow = rgb_utils.combine_rgb(secondary, 2, base_colors.yellow, 3);
    green = rgb_utils.combine_rgb(secondary, 1, base_colors.green, 1);
    cyan = rgb_utils.combine_rgb(secondary, 1, base_colors.cyan, 1);
    blue = rgb_utils.combine_rgb(rgb_utils.combine_rgb(secondary, 2, base_colors.blue, 3), 1, base_colors.white, 1);
    purple = rgb_utils.combine_rgb(rgb_utils.combine_rgb(secondary, 2, base_colors.purple, 3), 1, base_colors.white, 1);
    brown = rgb_utils.combine_rgb(secondary, 1, base_colors.brown, 3);
    pink = rgb_utils.combine_rgb(secondary, 1, base_colors.pink, 3);
    violet = rgb_utils.combine_rgb(secondary, 1, base_colors.violet, 3);
  };
  return colors;
end

local function get_combination_colors(background, foreground, secondary, off_base_colors)
  local colors = {
    red_dark = rgb_utils.combine_rgb(off_base_colors.red, 10, background, 6);
    orange_dark = rgb_utils.combine_rgb(off_base_colors.orange, 10, background, 6);
    blue_dark = rgb_utils.combine_rgb(off_base_colors.blue, 10, background, 6);
    green_dark = rgb_utils.combine_rgb(off_base_colors.green, 10, background, 6);

    background_darker = rgb_utils.combine_rgb(background, 1, base_colors.black, 2);
    foreground_darker = rgb_utils.combine_rgb(foreground, 1, base_colors.black, 1);
    selection = rgb_utils.combine_rgb(secondary, 3, background, 4);
    highlight = rgb_utils.combine_rgb(secondary, 3, background, 2);
    references = rgb_utils.combine_rgb(secondary, 1, background, 10);

    diff_add_background = rgb_utils.combine_rgb(off_base_colors.green, 1, background, 7);
    diff_add_highlight = rgb_utils.combine_rgb(off_base_colors.green, 1, background, 2);
    diff_delete_background = rgb_utils.combine_rgb(off_base_colors.red, 1, background, 5);
    diff_delete_highlight = rgb_utils.combine_rgb(off_base_colors.red, 1, background, 2);
  }

  return colors;
end


local function generate_colors(primary, secondary)
  local off_base_colors = get_off_base_colors(secondary);
  local background = rgb_utils.combine_rgb(primary, 1, base_colors.black, 6);
  local foreground = rgb_utils.combine_rgb(primary, 1, base_colors.white, 8);
  local combination_colors = get_combination_colors(background, foreground, secondary, off_base_colors);

  local colors = {
    background = rgb_utils.rgb_to_hex(background),
    foreground = rgb_utils.rgb_to_hex(foreground),
    primary = rgb_utils.rgb_to_hex(primary),
    secondary = rgb_utils.rgb_to_hex(secondary),
  }
  for key, value in pairs(off_base_colors) do colors[key] = rgb_utils.rgb_to_hex(value) end;
  for key, value in pairs(combination_colors) do colors[key] = rgb_utils.rgb_to_hex(value) end;

  return colors;
end

return generate_colors;

