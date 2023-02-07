local M = {}

function M.rgb_to_hex(color)
	return '#' .. string.format('%02X%02X%02X', color.r, color.g, color.b)
end

function M.random_rgb_color()
  local color = {};

  color.r = math.floor(math.random() * 255);
  color.g = math.floor(math.random() * 255);
  color.b = math.floor(math.random() * 255);

  return color;
end

function M.combine_rgb(color1, weight1, color2, weight2)
  local color = {};

  color.r = math.floor(((color1.r * weight1) + (color2.r * weight2)) / (weight1 + weight2))
  color.g = math.floor(((color1.g * weight1) + (color2.g * weight2)) / (weight1 + weight2))
  color.b = math.floor(((color1.b * weight1) + (color2.b * weight2)) / (weight1 + weight2))

  return color;
end

function M.complementary_rgb(color)
  local complementary = {};
  complementary.r = 255 - color.r;
  complementary.b = 255 - color.b
  complementary.g = 255 - color.g;
  return complementary;
end

function M.get_base_colors()
  return {
    black = {r = 0, g = 0, b = 0};
    white = {r = 255, g = 255, b = 255};
    red = {r = 255, g = 0, b = 0};
    orange = {r = 255, g = 123, b = 0};
    yellow = {r = 255, g = 255, b = 0};
    green = {r = 0, g = 255, b = 0};
    cyan = {r = 0, g = 255, b = 255};
    blue = {r = 0, g = 0, b = 255};
    purple = {r = 123, g = 0, b = 255};
    brown = {r = 82, g = 50, b = 40};
    pink = {r = 255, g = 0, b = 255};
    violet = {r = 180, g = 0, b = 255};
  }
end

return M

