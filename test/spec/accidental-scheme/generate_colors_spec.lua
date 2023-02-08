local generate_colors = require('accidental-scheme.generate_colors')

describe("generate colors should...", function()
  it('generate colors', function()
    local primary = {r = 100, g = 100, b = 100}
    local secondary = {r = 200, g = 200, b = 200}
    local colors = generate_colors.generate_colors(primary, secondary, false);

    assert.combinators.match(colors.primary, "#646464");
    assert.combinators.match(colors.secondary, "#C8C8C8");
    assert.combinators.match(colors.background, "#0E0E0E");
    assert.combinators.match(colors.foreground, "#EDEDED");
  end)

  it('generate shuffled accent colors', function()
    local secondary = {r = 200, g = 200, b = 200};
    local base = generate_colors.get_off_base_colors(secondary);
    local accent = generate_colors.get_accents(base, true);

    assert.is_true(accent.accent_one.r > 0);
    assert.is_true(accent.accent_two.r > 0);
    assert.is_true(accent.accent_three.r > 0);
    assert.is_true(accent.accent_four.r > 0);
    assert.is_true(accent.accent_five.r > 0);
    assert.is_true(accent.accent_six.r > 0);
    assert.is_true(accent.accent_seven.r > 0);
  end)
end)
