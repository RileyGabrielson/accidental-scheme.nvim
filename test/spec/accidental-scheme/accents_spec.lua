local generate_colors = require('accidental-scheme.generate_colors')
local accents = require('accidental-scheme.accents')

describe("accents should...", function()
  it('generate shuffled accent colors', function()
    local secondary = {r = 200, g = 200, b = 200};
    local base = generate_colors.get_off_base_colors(secondary);
    local accent_colors = accents.get_accents(base, false);

    assert.is_true(accent_colors.accent_one.r > 0);
    assert.is_true(accent_colors.accent_two.r > 0);
    assert.is_true(accent_colors.accent_three.r > 0);
    assert.is_true(accent_colors.accent_four.r > 0);
    assert.is_true(accent_colors.accent_five.r > 0);
    assert.is_true(accent_colors.accent_six.r > 0);
    assert.is_true(accent_colors.accent_seven.r > 0);
  end)

  it('generate constant accent colors', function()
    local secondary = {r = 200, g = 200, b = 200};
    local base = generate_colors.get_off_base_colors(secondary);
    local accent_colors = accents.get_accents(base, true);

    assert.combinators.match(accent_colors.accent_one.r, 233);
    assert.combinators.match(accent_colors.accent_one.g, 153);
    assert.combinators.match(accent_colors.accent_one.b, 80);
  end)
end)
