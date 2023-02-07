local make_scheme = require("accidental-scheme.make_scheme")

local accidental_scheme = {}

local function with_defaults(options)
  return {
    secondary = options.secondary or "complementary",
    highlight_overrides = options.highlight_overrides or {},
  }
end

function accidental_scheme.setup(options)
  accidental_scheme.options = with_defaults(options)
  vim.api.nvim_create_user_command("MakeAccidentalScheme", accidental_scheme.make_accidental_scheme, {})
end

function accidental_scheme.is_configured()
  return accidental_scheme.options ~= nil
end

function accidental_scheme.make_accidental_scheme()
  if not accidental_scheme.is_configured() then
    return
  end

  return make_scheme(accidental_scheme.options)
end

accidental_scheme.options = nil
return accidental_scheme