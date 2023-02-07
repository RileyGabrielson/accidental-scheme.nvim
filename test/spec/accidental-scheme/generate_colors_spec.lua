local generate_colors = require('accidental-scheme.generate_colors')

describe("rgb_utils should...", function()
  it('generate colors', function()
    local primary = {r = 100, g = 100, b = 100}
    local secondary = {r = 200, g = 200, b = 200}
    local colors = generate_colors(primary, secondary);

    assert.combinators.match(colors.primary, "#646464");
    assert.combinators.match(colors.secondary, "#C8C8C8");
    assert.combinators.match(colors.background, "#0E0E0E");
    assert.combinators.match(colors.foreground, "#EDEDED");
  end)
end)