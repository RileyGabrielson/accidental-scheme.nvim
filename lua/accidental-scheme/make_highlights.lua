local function make_highlights(colors, overrides)
  local default_highlights = {
    -- UI elements
    LineNr            = { fg = colors.line_numbers },
    CursorLine        = { bg = colors.background_darker },
    CursorLineNr      = { fg = colors.foreground_darker },
    CursorColumn      = { bg = colors.background_darker },
    Cursor            = { fg = colors.background, bg = colors.blue },
    TermCursor        = { fg = colors.background, bg = colors.blue },
    ColorColumn       = { bg = colors.background_darker },
    Search            = { bg = colors.highlight },
    IncSearch         = { bg = colors.highlight },
    Visual            = { bg = colors.selection },
    MatchParen        = { bg = colors.references },
    SignColumn        = { bg = 'NONE' },
    FoldColumn        = { fg = colors.line_numbers, bg = 'NONE' },
    Folded            = { fg = colors.comments, bg = colors.background_darker },
    VertSplit         = { fg = colors.highlight, bg = colors.background },
    Statusline        = { fg = colors.foreground_darker, bg = colors.statusline },
    StatuslineNC      = { fg = colors.foreground_darker, bg = colors.statusline },
    TabLine           = { fg = colors.foreground_darker, bg = colors.statusline },
    TabLineFill       = { fg = colors.foreground_darker, bg = colors.statusline },
    TabLineSel        = { fg = colors.foreground_darker, bg = colors.background },
    PMenu             = { bg = colors.background_darker },
    PMenuSBar         = { bg = colors.background_darker },
    PMenuThumb        = { bg = colors.background },
    PMenuSel          = { bg = colors.highlight },
    NormalFloat       = { bg = colors.background },
    FloatBorder       = { fg = colors.foreground_darker },
    Question          = { fg = colors.green },
    MoreMsg           = { fg = colors.green },
    Error             = { fg = colors.red },
    ErrorMsg          = { fg = colors.red },
    NvimInternalError = { fg = colors.red },
    WarningMsg        = { fg = colors.orange },
    Directory         = { fg = colors.blue },
    Conceal           = { fg = colors.brown },

    -- Syntax
    Normal      = { fg = colors.foreground, bg = colors.background },
    Identifier  = { fg = colors.foreground },
    Comment     = { fg = colors.comments, italic = true },
    NonText     = { fg = colors.comments },
    Keyword     = { fg = colors.purple },
    Repeat      = { fg = colors.purple },
    Conditional = { fg = colors.purple },
    Statement   = { fg = colors.purple },
    Include     = { fg = colors.purple },
    Function    = { fg = colors.blue },
    String      = { fg = colors.green },
    Delimiter   = { fg = colors.cyan },
    Operator    = { fg = colors.cyan },
    PreProc     = { fg = colors.cyan },
    Special     = { fg = colors.violet },
    Constant    = { fg = colors.orange },
    Todo        = { fg = colors.orange },
    Title       = { fg = colors.yellow },
    Type        = { fg = colors.yellow },
    Tag         = { fg = colors.yellow },
    SpellBad    = { undercurl = true, sp = colors.orange },
    SpellCap    = { undercurl = true, sp = colors.blue },
    SpellRare   = { undercurl = true, sp = colors.violet },
    SpellLocal  = { undercurl = true, sp = colors.cyan },
    Noise       = { fg = colors.cyan },
    SpecialKey  = { fg = colors.line_numbers },

    -- Git
    DiffAdd                = { bg = colors.diff_add_background },
    DiffDelete             = { bg = colors.background, fg = colors.line_numbers },
    DiffChange             = { bg = colors.diff_add_background },
    DiffText               = { bg = colors.diff_add_highlight },
    gitcommitHeader        = { fg = colors.purple },
    gitcommitOverflow      = { fg = colors.red },
    gitcommitUnmerged      = { fg = colors.green },
    gitcommitSelectedFile  = { fg = colors.green },
    gitcommitDiscardedFile = { fg = colors.red },
    gitcommitUnmergedFile  = { fg = colors.yellow },
    gitcommitSelectdType   = { fg = colors.green },
    gitcommitSummary       = { fg = colors.blue },
    gitcommitDiscardedType = { fg = colors.red },

    -- LSP
    DiagnosticError                  = { fg = colors.red },
    DiagnosticUnderlineError         = { fg = 'NONE', undercurl = true, sp = colors.red },
    DiagnosticWarn                   = { fg = colors.orange },
    DiagnosticUnderlineWarn          = { fg = 'NONE', undercurl = true, sp = colors.orange },
    DiagnosticInfo                   = { fg = colors.blue },
    DiagnosticUnderlineInfo          = { fg = 'NONE', undercurl = true, sp = colors.blue },
    DiagnosticHint                   = { fg = colors.foreground_darker },
    DiagnosticUnderlineHint          = { fg = colors.comments, undercurl = true, sp = colors.comments },
    LspReferenceText                 = { bg = colors.references },
    LspReferenceRead                 = { bg = colors.references },
    LspReferenceWrite                = { bg = colors.references },
    LspDiagnosticsVirtualTextError   = { fg = colors.red },
    LspDiagnosticsVirtualTextWarning = { fg = colors.orange },

    -- Treesitter
    ['@constructor']      = { link = 'Type' },
    ['@tag']              = { link = 'Tag' },
    ['@tag.delimiter']    = { fg = colors.foreground_darker },
    ['@tag.attribute']    = { link = 'Normal' },
    ['@variable.builtin'] = { link = 'Constant' },
    ['@variable']         = { link = 'Normal' },
    ['@function.builtin'] = { link = 'Function' },
    ['@constant.builtin'] = { link = 'Constant' },
    ['@text.literal']     = { fg = colors.foreground_darker },
    ['@text.title']       = { link = 'Title' },
    ['@text.uri']         = { fg = colors.blue, underline = true },
    ['@text.reference']   = { fg = colors.green },
    ['@text.strong']      = { bold = true },
    ['@text.emphasis']    = { italic = true },

    -- Markdown
    markdownCode          = { fg = colors.foreground_darker },
    markdownCodeDelimiter = { fg = colors.foreground_darker },

    -- Vimscript
    vimOption = { fg = colors.yellow },

    -- plasticboy/vim-markdown
    mkdHeading       = { fg = colors.green },
    mkdListItem      = { fg = colors.cyan },
    mkdCde          = { fg = colors.foreground_darker },
    mkdCodeDelimiter = { fg = colors.foreground_darker },

    -- lewis6991/gitsigns.nvim
    GitSignsAdd           = { fg = colors.green },
    GitSignsChange        = { fg = colors.orange },
    GitSignsDelete        = { fg = colors.red },
    GitSignsDeletePreview = { fg = colors.foreground, bg = colors.diff_delete_background },
    GitSignsAddInline     = { bg = colors.diff_add_highlight },
    GitSignsDeleteInline  = { bg = colors.diff_delete_hightlight },

    -- tpope/vim-fugitive
    diffAdded   = { fg = colors.green },
    diffRemoved = { fg = colors.red },

    -- hrsh7th/nvim-cmp
    CmpDocumentation   = { bg = colors.background_darker },
    CmpItemAbbrDefault = { fg = colors.foreground },

    CmpItemAbbr           = { fg = colors.foreground },
    CmpItemAbbrDeprecated = { fg = colors.foreground_darker, strikethrough = true },
    CmpItemAbbrMatch      = { fg = colors.blue },
    CmpItemAbbrMatchFuzzy = { fg = colors.blue },

    CmpItemMenu = { fg = colors.comments },

    CmpItemKindDefault = { fg = colors.foreground_darker },

    CmpItemKindKeyword   = { fg = colors.purple },
    CmpItemKindReference = { fg = colors.purple },
    CmpItemKindValue     = { fg = colors.purple },
    CmpItemKindVariable  = { fg = colors.purple },

    CmpItemKindConstant   = { fg = colors.orange },
    CmpItemKindEnum       = { fg = colors.orange },
    CmpItemKindEnumMember = { fg = colors.orange },
    CmpItemKindOperator   = { fg = colors.orange },
    CmpItemKindField      = { fg = colors.orange },

    CmpItemKindFunction = { fg = colors.blue },
    CmpItemKindMethod   = { fg = colors.blue },

    CmpItemKindConstructor = { fg = colors.yellow },
    CmpItemKindClass       = { fg = colors.yellow },
    CmpItemKindInterface   = { fg = colors.yellow },
    CmpItemKindStruct      = { fg = colors.yellow },
    CmpItemKindEvent       = { fg = colors.yellow },
    CmpItemKindUnit        = { fg = colors.yellow },
    CmpItemKindFile        = { fg = colors.yellow },
    CmpItemKindFolder      = { fg = colors.yellow },

    CmpItemKindModule        = { fg = colors.green },
    CmpItemKindProperty      = { fg = colors.green },
    CmpItemKindTypeParameter = { fg = colors.green },
    CmpItemKindSnippet       = { fg = colors.green },
    CmpItemKindText          = { fg = colors.green },

    -- nvim-telescope/telescope.nvim
    TelescopeNormal         = { bg = colors.background_darker },
    TelescopeBorder         = { fg = colors.background_darker, bg = colors.background_darker },
    TelescopeMatching       = { fg = colors.blue },
    TelescopePromptNormal   = { bg = colors.references },
    TelescopePromptBorder   = { fg = colors.references, bg = colors.references },
    TelescopePromptTitle    = { bg = colors.references },
    TelescopePromptPrefix   = { fg = colors.blue },
    TelescopeSelectionCaret = { fg = colors.blue, bg = colors.highlight },
    TelescopeSelection      = { bg = colors.references },

    -- kyazdani42/nvim-tree.lua
    NvimTreeRootFolder = { fg = colors.green },
    NvimTreeGitDirty   = { fg = colors.green },

    -- rcarriga/nvim-notify
    NotifyERRORBorder = { fg = colors.red_dark },
    NotifyERRORIcon   = { fg = colors.red },
    NotifyERRORTitle  = { fg = colors.red },
    NotifyWARNBorder  = { fg = colors.orange_dark },
    NotifyWARNIcon    = { fg = colors.orange },
    NotifyWARNTitle   = { fg = colors.orange },
    NotifyINFOBorder  = { fg = colors.green_dark },
    NotifyINFOIcon    = { fg = colors.green },
    NotifyINFOTitle   = { fg = colors.green },
    NotifyDEBUGBorder = { fg = colors.foreground_darker },
    NotifyDEBUGIcon   = { fg = colors.foreground_darker },
    NotifyDEBUGTitle  = { fg = colors.foreground_darker },
    NotifyLogTitle    = { fg = colors.yellow },
    NotifyBackground  = { bg = colors.background },

    -- folke/lazy.nvim
    LazyNormal = { bg = colors.background_darker },

    -- tamago324/lir.nvim
    LirDir          = { fg = colors.blue },
    LirEmptyDirText = { bg = colors.highlight },
    CursorLineLir   = { bg = colors.highlight },

    -- folke/noice.nvim
    NoiceCmdlinePopup = { bg = colors.background_darker },
    NoiceMini         = { bg = colors.background_darker },

    -- L3MON4D3/LuaSnip
    LuasnipChoice = { fg = colors.orange },
    LuasnipInsert = { fg = colors.cyan },
  }

  local highlights = vim.tbl_deep_extend('force', default_highlights, overrides);
  return highlights;
end

local function highlight(group, colors)
  local style = {
    bold = colors.style == 'bold',
    standout = colors.style == 'standout',
    underline = colors.style == 'underline',
    undercurl = colors.style == 'undercurl',
    underdouble = colors.style == 'underdouble',
    underdotted = colors.style == 'underdotted',
    underdashed = colors.style == 'underdashed',
    strikethrough = colors.style == 'strikethrough',
    italic = colors.style == 'italic',
    reverse = colors.style == 'reverse',
    nocombine = colors.style == 'nocombine',
  }

  vim.api.nvim_set_hl(
    0,
    group,
    vim.tbl_extend('force', style, colors, {
      fg = colors.fg or 'NONE',
      bg = colors.bg or 'NONE',
      sp = colors.sp or 'NONE',
    })
  )
end

local M = {}
M.highlights = nil

function M.highlight_colors(colors, overrides)
  if vim.g.colors_name then
    vim.cmd [[hi clear]]
  end

  vim.o.termguicolors = true
  vim.g.colors_name = 'random-scheme'

  local highlights = make_highlights(colors, overrides);
  M.highlights = highlights;

  for group, hls in pairs(highlights) do
    highlight(group, hls)
  end
end

return M
