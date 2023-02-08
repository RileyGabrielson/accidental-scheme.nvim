local M = {}

function M.shuffle(t)
    local s = {}
    for i = 1, #t do s[i] = t[i] end
    for i = #t, 2, -1 do
        local j = math.random(i)
        s[i], s[j] = s[j], s[i]
    end
    return s
end

function M.to_shuffled_array(tbl)
  local array = {};
  local k = 1;
  for _, value in pairs(tbl) do
    array[k] = value;
    k = k + 1;
  end;

  return M.shuffle(array)
end

function M.get_shuffled_accents(off_base_colors)
  local base_colors_array = M.to_shuffled_array(off_base_colors);

  local accents = {
    accent_one = base_colors_array[1],
    accent_two = base_colors_array[2],
    accent_three = base_colors_array[3],
    accent_four = base_colors_array[4],
    accent_five = base_colors_array[5],
    accent_six = base_colors_array[6],
    accent_seven = base_colors_array[7],
  };
  return accents;
end

function M.get_unshuffled_accents(off_base_colors)
  local accents = {
    accent_one = off_base_colors.orange,
    accent_two = off_base_colors.yellow,
    accent_three = off_base_colors.green,
    accent_four = off_base_colors.cyan,
    accent_five = off_base_colors.blue,
    accent_six = off_base_colors.purple,
    accent_seven = off_base_colors.violet,
  };
  return accents;
end

function M.get_accents(off_base_colors, constant_accents)
  if constant_accents then
    return M.get_unshuffled_accents(off_base_colors);
  end
  return M.get_shuffled_accents(off_base_colors);
end

return M
