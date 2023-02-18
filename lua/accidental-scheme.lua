local make_scheme = require("accidental-scheme.make_scheme")

local accidental_scheme = {}

local function with_defaults(options)
  return {
    secondary = options.secondary or "complementary",
    highlight_overrides = options.highlight_overrides or {},
    constant_accents = options.constant_accents or false,
    accent_cohesion_factor = options.accent_cohesion_factor or 1,
  }
end

function accidental_scheme.setup(options)
  accidental_scheme.options = with_defaults(options)
  vim.api.nvim_create_user_command("AccidentalSchemeNew", accidental_scheme.new_scheme, {})
end

function accidental_scheme.is_configured()
  return accidental_scheme.options ~= nil
end

function accidental_scheme.new_scheme()
  if not accidental_scheme.is_configured() then
    return
  end

  return make_scheme(accidental_scheme.options)
end

accidental_scheme.options = nil
return accidental_scheme
