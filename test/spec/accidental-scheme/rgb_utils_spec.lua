local rgb_utils = require('accidental-scheme.rgb_utils')

describe("rgb_utils should...", function()
  it('generate random color', function()
    local color = rgb_utils.random_rgb_color();
    assert.is_true(color.r > 0 and color.r < 255);
    assert.is_true(color.g > 0 and color.g < 255);
    assert.is_true(color.b > 0 and color.b < 255);
  end)

  it('convert color to hex', function()
    local black = {r = 0, g = 0, b = 0};
    assert.combinators.match(rgb_utils.rgb_to_hex(black), "#000000");

    local pale_blue = {r = 65, g = 73, b = 166};
    assert.combinators.match(rgb_utils.rgb_to_hex(pale_blue), "#4149A6");
  end)

  it('combine rgb colors', function()
    local black = {r = 0, g = 0, b = 0};
    local white = {r = 255, g = 255, b = 255};
    local grey = rgb_utils.combine_rgb(black, 1, white, 1);
    assert.combinators.match(grey.r, 127);
    assert.combinators.match(grey.g, 127);
    assert.combinators.match(grey.b, 127);

    local off_white = rgb_utils.combine_rgb(black, 1, white, 9);
    assert.combinators.match(off_white.r, 229);
    assert.combinators.match(off_white.g, 229);
    assert.combinators.match(off_white.b, 229);
  end)

  it('get complementary color', function()
    local red = {r = 255, g = 0, b = 0};
    local cyan = rgb_utils.complementary_rgb(red);
    assert.combinators.match(cyan.r, 0);
    assert.combinators.match(cyan.g, 255);
    assert.combinators.match(cyan.b, 255);

    local off_yellow = {r = 224, g = 237, b = 38};
    local off_blue = rgb_utils.complementary_rgb(off_yellow);
    assert.combinators.match(off_blue.r, 31);
    assert.combinators.match(off_blue.g, 18);
    assert.combinators.match(off_blue.b, 217);
  end)
end)

