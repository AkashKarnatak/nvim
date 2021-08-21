vim.g.colors_name = "mymonokai/mymonokai"

-- local yellow         = {"#ffff87", 228, "yellow"}
-- local purple         = {"#af87ff", 141, "darkblue"}
-- local light_green    = {"#A4E400", 148, "brightgreen"}
-- local light_blue     = {"#62D8F1", 81, "brightblue"}
-- local magenta        = {"#FC1A70", 197, "magenta"}
-- local orange         = {"#FF9700", 208, "darkyellow"}
-- local black          = {"#000000",   0, "black"}
-- local bright_yellow  = {"#ffff00",  11, "brightyellow"}
-- local white          = {"#ffffff", 231, "brightwhite"}
-- local light_grey     = {"#bcbcbc", 250, "gray"}
-- local grey           = {"#8a8a8a", 245, "darkgray"}
-- local dark_grey      = {"#5f5f5f", 59, "darkgray"}
-- local darker_grey    = {"#444444", 238, "brightblack"}
-- local light_charcoal = {"#2b2b2b", 238, "black"}
-- local charcoal       = {"#262626", 235, "darkblack"}
-- local danger         = {"#ff005f", 197, "darkmagenta"}
-- local olive          = {"#5f8700",  64, "darkgreen"}
-- local dark_red       = {"#870000",  88, "red"}
-- local blood_red      = {"#5f0000",  52, "darkred"}
-- local dark_green     = {"#005f00",  22, "darkgreen"}
-- local bright_blue    = {"#0087ff",  33, "darkblue"}
-- local none           = {"none",  60, "mono_1"}
-- local bold           = {"bold", 250, "mono_1"}
-- local underline      = {"underline", 250, "mono_1"}
-- local bold_underline = {"bold_underline", 250, "mono_1"}

-- if vim.o.background == "dark" then
local yellow         = {"#ffff87", 228, "yellow"}
local purple         = {"#af87ff", 141, "darkblue"}
local light_green    = {"#A4E400", 148, "brightgreen"}
local light_blue     = {"#62D8F1", 81, "brightblue"}
local magenta        = {"#FC1A70", 197, "magenta"}
local orange         = {"#FF9700", 208, "darkyellow"}
local black          = {"#000000",   0, "black"}
local bright_yellow  = {"#ffff00",  11, "brightyellow"}
local white          = {"#ffffff", 231, "brightwhite"}
local light_grey     = {"#bcbcbc", 250, "gray"}
local grey           = {"#8a8a8a", 245, "darkgray"}
local dark_grey      = {"#5f5f5f", 59, "darkgray"}
local darker_grey    = {"#444444", 238, "brightblack"}
local light_charcoal = {"#2b2b2b", 238, "black"}
local charcoal       = {"#262626", 235, "darkblack"}
local danger         = {"#ff005f", 197, "darkmagenta"}
local olive          = {"#5f8700",  64, "darkgreen"}
local dark_red       = {"#870000",  88, "red"}
local blood_red      = {"#5f0000",  52, "darkred"}
local dark_green     = {"#005f00",  22, "darkgreen"}
local bright_blue    = {"#0087ff",  33, "darkblue"}
local purple_slate   = {"#5f5f87",  60, "white"}

local error          = {"#fd2c40", 197, "white"}
    
-- end
    -- none           = {"none",  60, "mono_1"}
    -- bold           = {"bold", 250, "mono_1"}
    -- underline      = {"underline", 250, "mono_1"}
    -- bold_underline = {"bold_underline", 250, "mono_1"}
--else 
--     --[[ 
--          Light Colors
--          @syntax-hue:          230;
--          @syntax-saturation:   1%;
--          @syntax-brightness:   98%;
--          @syntax-fg:     @mono-1;
--          @syntax-gutter-background-color-selected: darken(@syntax-bg, 8%);
--          for color in $(cat colors/one-nvim.vim | head -n 79 | tail -n 28 | cut -d '#' -f2 | cut -d '"' -f1); do hex2xterm $color | grep 'Hexadecimal\|xterm256'; done
--     --]]
--     mono_1        = {"#383A42",  59, "mono_1"}        -- hsl(@syntax-hue, 8%, 24%);
--     mono_2        = {"#696c77",  60, "mono_2"}        -- hsl(@syntax-hue, 6%, 44%);
--     mono_3        = {"#a0a1a7", 247, "mono_3"}        -- hsl(@syntax-hue, 4%, 64%);
--     mono_4        = {"#c2c2c3", 251, "mono_4"}        --
--     hue_1         = {"#0184bc",  31, "hue_1"}         -- hsl(198, 99%, 37%);
--     hue_2         = {"#4078f2",  69, "hue_2"}         -- hsl(221, 87%, 60%);
--     hue_3         = {"#a626a4", 243, "hue_3"}         -- hsl(301, 63%, 40%);
--     hue_4         = {"#50a14f", 242, "hue_4"}         -- hsl(119, 34%, 47%);
--     hue_5         = {"#e45649", 244, "hue_5"}         -- hsl(  5, 74%, 59%);
--     hue_5_2       = {"#ca1243", 241, "hue_5_2"}       -- hsl(344, 84%, 43%);
--     hue_6         = {"#986801",  94, "hue_6"}         -- hsl(41, 99%, 30%);
--     hue_6_2       = {"#c18401", 242, "hue_6_2"}       -- hsl(41, 99%, 38%)
--     syntax_bg     = {"#fafafa", 231, "syntax_bg"}     -- hsl(@syntax-hue, @syntax-saturation, @syntax-brightness);
--     syntax_gutter = {"#9e9e9e", 247, "syntax_gutter"} -- darken(@syntax-bg, 36%);
--     syntax_cursor = {"#f0f0f0", 255, "syntax_cursor"}
--     syntax_accent = {"#526fff", 246, "syntax_accent"} -- hsl(@syntax-hue, 100%, 66% );
--     vertsplit     = {"#e7e9e1", 254, "vertsplit"}
--     special_grey  = {"#d3d3d3", 252, "special_grey"}
--     visual_grey   = {"#d0d0d0", 252, "visual_grey"}
--     pmenu         = {"#dfdfdf", 254, "pmenu"}
--     term_black    = {"#383a42", 237, "term_black"}
--     term_blue     = {"#0184bc", 31, "term_blue"}
--     term_cyan     = {"#0997b3", 243, "term_cyan"}
--     term_white    = {"#fafafa", 231, "term_white"}
--     term_8        = {"#4f525e", 240, "term_8"}
--     syntax_color_added    = {"#2db448", 65, "syntax_color_added"}    -- hsl(132,  60%, 44%);
--     syntax_color_modified = {"#f2a60d", 137, "syntax_color_modified"} -- hsl(40,   90%, 50%);
--     syntax_color_removed  = {"#ff1414", 88, "syntax_color_removed"}  -- hsl(0,    100%, 54%);
--end

-- Common 
local pink = {"#d291e4", 251, "pink"}
syntax_color_renamed  = {"#33a0ff", 75, "syntax_color_renamed"}  -- hsl(208, 100%, 60%);

---- Vim Primary Colors
----[[
--     Mentioned here https://github.com/Th3Whit3Wolf/onebuddy/pull/7
--     vim-startify and maybe more plugins rely on these colors
----]]
--Red  = {"#e88388", 174, "Red"}
--DarkRed  = {"#e06c75", 168, "DarkRed"}
--Blue  = {"#61afef", 75, "Blue"}
--DarkBlue  = {"#528bff", 69, "DarkBlue"}
--Green  = {"#98c379", 114, "Green"}
--DarkGreen  = {"#50a14f", 242, "DarkGreen"}
--Orange  = {"#d19a66", 247, "Orange"}
--DarkOrange  = {"#c18401", 232, "DarkOrange"}
--Yellow  = {"#e5c07b", 180, "Yellow"}
--DarkYellow  = {"#986801", 94, "DarkYellow"}
--Purple  = {"#a626a4", 243, "Purple"}
--Violet  = {"#b294bb", 139, "Violet"}
--Magenta  = {"#ff80ff", 213, "Magenta"}
--DarkMagenta  = {"#a626a4", 243, "DarkMagenta"}
--Black  = {"#333841", 59 , "Black"}
--Grey  = {"#636d83", 243, "Grey"}
--White  = {"#f2e5bc", 223, "White"}
--Cyan  = {"#8abeb7", 109, "Cyan"}
--DarkCyan  = {"#80a0ff", 111, "DarkCyan"}
--Aqua  = {"#8ec07c", 108, "Aqua"}

--[[ DO NOT EDIT `BG` NOR `FG`. ]]
local BG = "bg"
local FG = "fg"
local NONE = {}

--[[ These are the ones you should edit. ]]
-- This is the only highlight that must be defined separately.
local highlight_group_normal = {fg = light_grey, bg = black}

local normal = (function()
    if vim.g.one_nvim_transparent_bg ~= true then
        return  { fg = mono_1, bg = syntax_bg }
    else
        return  { fg = mono_1, bg = NONE }
    end
end)()

-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
local highlight_groups = {
    Normal                                = { fg = white, bg = charcoal },

    Cursor                                = { fg = charcoal, bg = light_blue },
    Special                               = { fg = purple },
    Title                                 = { fg = white, style = 'bold' },

    Error                                 = { fg = white, bg = danger },
    ErrorMsg                              = { fg = white, bg = danger },
    WarningMsg                            = { fg = white, bg = danger },
    SpellBad                              = { fg = white, bg = danger },
    SpellRare                             = { fg = white, bg = danger },
    SpellCap                              = { fg = charcoal, bg = orange, style = 'italic' },
    SpellLocal                            = { fg = charcoal, bg = orange, style = 'italic' },

    CursorLineNR                          = { fg = yellow },

    CursorColumn                          = { bg = darker_grey },
    ColorColumn                           = { bg = light_charcoal },
    Conceal                               = { bg = none },
    CursorLine                            = { bg = darker_grey },
    Type                                  = { bg = none },

    -- quickfix window

    qfFileName                            = { fg = purple },
    qfLineNr                              = { fg = light_blue },
    qfSeparator                           = { fg = light_grey },
    QuickFixLine                          = { fg = light_green, bg = light_charcoal, style = 'bold' },

    Visual                                = { bg = dark_grey },
    TabLine                               = { fg = light_grey, bg = dark_grey, style = 'underline' },
    Whitespace                            = { fg = dark_grey },

    TabLineSel                            = { bg = charcoal, style = 'bold' },

    SignColumn                            = { bg = none },
    NonText                               = { fg = darker_grey },
    TabLineFill                           = { bg = darker_grey },
    LineNr                                = { fg = dark_grey },
    VertSplit                             = { fg = darker_grey, bg = charcoal },
    StatusLine                            = { fg = white, bg = dark_grey },
    StatusLineNC                          = { fg = light_grey, bg = darker_grey },

    Exception                             = { fg = magenta, style = 'bold' },
    MatchParen                            = { fg = magenta, style = 'bold,underline' },
    Include                               = { fg = magenta },
    Conditional                           = { fg = magenta },
    Define                                = { fg = magenta },
    Debug                                 = { fg = magenta },
    Delimiter                             = { fg = magenta },
    Keyword                               = { fg = magenta },
    Macro                                 = { fg = magenta },
    Operator                              = { fg = magenta },
    PreProc                               = { fg = magenta },
    Statement                             = { fg = magenta },
    Repeat                                = { fg = magenta },

    diffChange                            = { fg = white, bg = purple_slate },
    diffText                              = { fg = white, bg = bright_blue, style = 'bold' },
    diffDelete                            = { fg = dark_red, bg = blood_red },
    diffAdd                               = { fg = white, bg = dark_green },
    diffAdded                             = { fg = light_green },
    diffRemoved                           = { fg = magenta },
    diffFile                              = { fg = white, style = 'bold' },
    diffLine                              = { fg = purple, style = 'bold' },
    diffIndexLine                         = { fg = purple, style = 'bold' },
    diffSubname                           = { fg = yellow },
    gitcommitHeader                       = { fg = light_blue },
    gitcommitSelectedFile                 = { fg = orange },
    gitcommitSummary                      = { fg = white },
    gitcommitOverflow                     = { fg = magenta },

    SpecialKey                            = { fg = dark_grey, bg = darker_grey },
    IncSearch                             = { fg = bright_yellow, bg = black, style = 'bold,underline' },
    Search                                = { fg = black, bg = bright_yellow, style = 'bold' },

    Identifier                            = { fg = light_blue },
    Question                              = { fg = light_blue },
    StorageClass                          = { fg = light_blue, style = 'italic' },
    Structure                             = { fg = light_blue },
    Typedef                               = { fg = light_blue },

    Function                              = { fg = light_green },

    PreCondit                             = { fg = purple },
    Constant                              = { fg = purple },
    Directory                             = { fg = purple },
    Tag                                   = { fg = purple },
    Boolean                               = { fg = purple },
    Character                             = { fg = purple },
    Float                                 = { fg = purple },
    Number                                = { fg = purple },
    jsFutureKeys                          = { fg = purple },

    Folded                                = { fg = grey },
    FoldColumn                            = { fg = light_grey },
    Comment                               = { fg = grey, style = 'italic' },

    Label                                 = { fg = yellow },
    String                                = { fg = yellow },

    Todo                                  = { fg = yellow, bg = dark_grey, style = 'bold' },
    Underlined                            = { bg = none, style = 'underline' },

    Pmenu                                 = { fg = light_blue, bg = darker_grey },
    PmenuSel                              = { fg = yellow, bg = dark_grey },
    PmenuSbar                             = { bg = grey },
    PmenuThumb                            = { fg = dark_grey, bg = white },

    MoreMsg                               = { fg = light_green },

    -- Javascript colour highlighting rules

    Noise                                 = { fg = magenta },
    jsParensIfElse                        = { fg = white },
    jsParensRepeat                        = { fg = white },
    jsParensSwitch                        = { fg = white },
    jsParensCatch                         = { fg = white },

    jsArrowFunction                       = { fg = light_blue },
    jsArrowFuncArgs                       = { fg = orange, style = 'italic' },

    jsBrackets                            = { fg = white },
    jsBraces                              = { fg = white },
    jsFuncBraces                          = { fg = white },
    jsClassBraces                         = { fg = white },
    jsIfElseBraces                        = { fg = white },

    jsTryCatchBraces                      = { fg = white },
    jsModuleBraces                        = { fg = white },
    jsObjectBraces                        = { fg = white },
    jsFinallyBraces                       = { fg = white },
    jsRepeatBraces                        = { fg = white },
    jsSwitchBraces                        = { fg = white },
    jsTemplateBraces                      = { fg = purple },

    jsDestructuringBraces                 = { fg = white },
    jsFuncName                            = { fg = light_green },
    jsFuncCall                            = { fg = light_blue },
    jsClassFuncName                       = { fg = light_green },
    jsArguments                           = { fg = orange, style = 'italic' },
    jsFuncArgs                            = { fg = orange, style = 'italic' },
    jsClassKeyword                        = { fg = light_blue, style = 'italic' },

    jsThis                                = { fg = orange, style = 'italic' },
    jsUndefined                           = { fg = purple },
    jsNull                                = { fg = purple },
    jsParens                              = { fg = white },
    jsFuncParens                          = { fg = white },
    jsGlobalObjects                       = { fg = light_blue },
    jsFunction                            = { fg = light_blue, style = 'italic' },
    jsClassMethodType                     = { fg = light_blue, style = 'italic' },
    jsObjectKey                           = { fg = white },
    jsBlockLabel                          = { fg = white },
    jsObjectColon                         = { fg = magenta },
    jsObjectSeparator                     = { fg = purple },
    jsNoise                               = { fg = white },
    jsGlobalNodeObjects                   = { fg = magenta },

    EcmaScriptTemplateStrings             = { fg = yellow, style = 'italic' },

    -- HTML

    htmlTag                               = { fg = white },

    -- JSX highlighting

    jsxTagName                            = { fg = purple },
    jsxComponentName                      = { fg = light_blue },
    jsxEqual                              = { fg = magenta },
    jsxPunct                              = { fg = grey },
    jsxCloseString                        = { fg = grey },
    jsxAttrib                             = { fg = white, style = 'italic' },

    -- Typescript

    -- 'HerringtonDarkholme/yats.vim'

    typescriptCastKeyword                 = { fg = magenta },
    typescriptImport                      = { fg = magenta },
    typescriptExport                      = { fg = magenta },
    typescriptCall                        = { fg = white, style = 'italic' },
    typescriptArrowFuncArg                = { fg = orange, style = 'italic' },
    typescriptAliasDeclaration            = { fg = light_green },
    typescriptAliasKeyword                = { fg = light_blue, style = 'italic' },
    typescriptInterfaceKeyword            = { fg = light_blue, style = 'italic' },
    typescriptTypeReference               = { fg = light_green },
    typescriptPredefinedType              = { fg = light_blue, style = 'italic' },
    typescriptMember                      = { fg = white, style = 'italic' },
    typescriptObjectColon                 = { fg = magenta },
    typescriptTypeAnnotation              = { fg = magenta },
    typescriptTernaryOp                   = { fg = magenta },
    typescriptDestructureVariable         = { fg = white },
    typescriptObjectLabel                 = { fg = white },
    typescriptTypeBrackets                = { fg = light_blue },
    typescriptVariable                    = { fg = light_blue, style = 'italic' },
    typescriptArrowFunc                   = { fg = light_blue },
    typescriptFuncType                    = { fg = orange, style = 'italic' },
    typescriptMemberOptionality           = { fg = magenta },
    typescriptFuncTypeArrow               = { fg = light_blue },
    typescriptMathStaticMethod            = { fg = light_blue },
    typescriptJSONStaticMethod            = { fg = light_blue },
    typescriptDOMStorageMethod            = { fg = light_blue },
    typescriptDateMethod                  = { fg = light_blue },
    typescriptRegExpMethod                = { fg = light_blue },
    typescriptArrayMethod                 = { fg = light_blue },
    typescriptHeadersMethod               = { fg = light_blue },
    typescriptHeadersMethod               = { fg = light_blue },
    typescriptURLUtilsProp                = { fg = light_blue },
    typescriptBOMHistoryProp              = { fg = light_blue },
    typescriptOperator                    = { fg = magenta },
    typescriptGlobalMathDot               = { fg = magenta },
    typescriptDotNotation                 = { fg = magenta },
    typescriptGlobalJSONDot               = { fg = magenta },
    typescriptBinaryOp                    = { fg = magenta },
    typescriptUnaryOp                     = { fg = magenta },
    typescriptAssign                      = { fg = magenta },
    typescriptOptionalMark                = { fg = purple, style = 'italic' },
    typescriptTemplateSB                  = { fg = purple },
    typescriptTestGlobal                  = { fg = light_blue },
    typescriptPaymentShippingOptionProp   = { bg = none },

    -- 'leafgarland/typescript-vim'

    typescriptNull                        = { fg = purple },
    typescriptType                        = { fg = light_blue, style = 'italic' },
    typescriptEndColons                   = { fg = white },
    typescriptLabel                       = { fg = magenta },
    typescriptLogicSymbols                = { fg = magenta },
    typescriptParens                      = { fg = white },
    typescriptBraces                      = { fg = white },
    typescriptDotNotation                 = { fg = magenta },
    typescriptInterpolationDelimiter      = { fg = purple },
    typescriptExceptions                  = { fg = magenta, style = 'bold' },
    typescriptFuncKeyword                 = { fg = light_blue, style = 'italic' },

    -- New typescript definition names

    typescriptGlobalNodeObjects           = { fg = magenta },
    typescriptGlobalObjects               = { fg = light_blue },
    typescriptArrowFunction               = { fg = light_blue },
    typescriptFuncCall                    = { fg = light_blue },

    -- GraphQL

    graphqlStructure                      = { fg = magenta },
    graphqlBraces                         = { fg = white },
    graphqlConstant                       = { fg = white },
    graphqlType                           = { fg = purple },

    -- vim

    vimParenSep                           = { fg = white, style = 'bold' },
    vimOperParen                          = { fg = light_blue, style = 'italic' },
    vimUserFunc                           = { fg = purple },
    vimFunction                           = { fg = orange },

    -- XML highlighting.

    xmlTag                                = { fg = light_blue },
    xmlTagName                            = { fg = light_blue },
    xmlEndTag                             = { fg = light_blue },
    xmlEqual                              = { fg = magenta },

    -- JSON highlighting

    jsonKeyword                           = { fg = light_blue },
    jsonString                            = { fg = yellow },

    -- Clojure highlighting

    clojureParen                          = { fg = white },
    clojureDefine                         = { fg = light_blue, style = 'italic' },
    clojureMacro                          = { fg = light_blue },

    -- R language

    rFunction                             = { fg = light_blue },

    -- C/C++

    cType                                 = { fg = light_blue, style = 'italic' },

    -- NERDTree highlighting

    NERDTreeClosable                      = { fg = yellow },
    NERDTreeOpenable                      = { fg = yellow },
    NERDTreeDirSlash                      = { fg = light_blue },
    NERDTreeFile                          = { bg = none },

    -- Ruby

    rubyStringDelimiter                   = { fg = yellow },

    -- Calendar

    CalNavi                               = { fg = light_blue, style = 'bold,underline' },
    CalToday                              = { fg = magenta, style = 'bold' },
    CalSaturday                           = { fg = purple },
    CalSunday                             = { fg = purple },
    CalHeader                             = { fg = light_green },
    CalRuler                              = { fg = grey, bg = darker_grey, style = 'bold' },

    -- Markdown https://github.com/tpope/vim-markdown/

    markdownCode                          = { fg = light_grey, style = 'bold' },
    markdownCodeDelimiter                 = { fg = yellow },

    -- Markdown https://github.com/plasticboy/vim-markdown

    mkdHeading                            = { fg = magenta },
    mkdURL                                = { fg = purple },
    mkdCode                               = { fg = orange },
    mkdCodeStart                          = { fg = light_green },
    mkdCodeEnd                            = { fg = light_green },
    mkdDelimiter                          = { fg = light_blue },

    -- Vimwiki

    VimwikiDelText                        = { fg = grey },
    VimwikiHeaderChar                     = { fg = magenta, style = 'bold' },
    VimwikiHeader1                        = { fg = white, style = 'bold' },
    VimwikiHeader2                        = { fg = white, style = 'bold' },
    VimwikiHeader3                        = { fg = white, style = 'bold' },
    VimwikiHeader4                        = { fg = white, style = 'bold' },
    VimwikiHeader5                        = { fg = white, style = 'bold' },
    VimwikiHeader6                        = { fg = white, style = 'bold' },
    VimwikiPre                            = { fg = light_green, style = 'bold' },
    VimwikiCode                           = { fg = purple },
    VimwikiCodeChar                       = { fg = purple },
    VimwikiBoldChar                       = { bg = none },
    VimwikiItalicChar                     = { bg = none },

    -- GitGutter

    GitGutterAdd                          = { fg = light_green },
    GitGutterChange                       = { fg = light_blue },
    GitGutterDelete                       = { fg = magenta },
    GitGutterChangeDelete                 = { fg = orange },

    -- Python

    pythonBuiltin                         = { fg = light_blue },
    pythonBuiltinFunc                     = { fg = light_blue },
    pythonFunctionCall                    = { fg = light_blue },

    -- Nvim LSP

    LspDiagnosticsDefaultError            = { fg = error },
    LspDiagnosticsDefaultWarning          = { fg = yellow },
    LspDiagnosticsDefaultInformation      = { fg = white },
    LspDiagnosticsDefaultHint             = { fg = light_grey },
    LspDiagnosticsUnderlineError          = { bg = none, style = 'underline' },
    LspDiagnosticsUnderlineWarning        = { bg = none, style = 'underline' },
    LspDiagnosticsUnderlineInformation    = { bg = none, style = 'underline' },
    LspDiagnosticsUnderlineHint           = { bg = none, style = 'underline' },

}
-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


---- This is where the rest of your highlights should go.
--local highlight_groups = {
--    -------------------------------------------------------------
--    -- Syntax Groups (descriptions and ordering from `:h w18`) --
--    -------------------------------------------------------------
--     Normal       = normal,
--     bold         = { style = 'bold'},
--     ColorColumn  = { fg = none, bg = syntax_cursor },
--     Conceal      = { fg = mono_4, bg = syntax_bg },
--     Cursor       = { fg = none, bg = syntax_accent },
--     CursorIM     = { fg = none},
--     CursorColumn = { fg = none, bg = syntax_cursor },
--     CursorLine   = { fg = none, bg = syntax_cursor },
--     Directory    = { fg = hue_2 },
--     ErrorMsg     = { fg = hue_5, bg = syntax_bg },
--     VertSplit    = { fg = vertsplit },
--     Folded       = { fg = mono_3, bg = syntax_bg },
--     FoldColumn   = { fg = mono_3, bg = syntax_cursor },
--     IncSearch    = { fg = hue_6, bg = mono_3 },
--     LineNr       = { fg = mono_4 },
--     CursorLineNr = { fg = mono_1, bg = syntax_cursor },
--     MatchParen   = { fg = hue_5, bg = syntax_cursor, style = 'underline,bold' },
--     Italic       = { fg = none, style = 'italic'},
--     ModeMsg      = { fg = mono_1 },
--     MoreMsg      = { fg = mono_1 },
--     NonText      = { fg = mono_3 },
--     PMenu        = { fg = none, bg = pmenu },
--     PMenuSel     = { fg = none, bg = mono_4 },
--     PMenuSbar    = { fg = none, bg = syntax_bg },
--     PMenuThumb   = { fg = none, bg = mono_1 },
--     Question     = { fg = hue_2 },
--     Search       = { fg = syntax_bg, bg = hue_6_2 },
--     SpecialKey   = { fg = special_grey},
--     Whitespace   = { fg = special_grey},
--     StatusLine   = { fg = mono_1, bg = syntax_cursor },
--     StatusLineNC = { fg = mono_3 },
--     TabLine      = { fg = mono_2, bg = visual_grey},
--     TabLineFill  = { fg = mono_3, bg = visual_grey},
--     TabLineSel   = { fg = syntax_bg, bg = hue_2 },
--     Title        = { fg = mono_1, bg = none, style = 'bold'},
--     Visual       = { fg = none, bg = visual_grey},
--     VisualNOS    = { fg = none, bg = visual_grey},
--     WarningMsg   = { fg = hue_5 },
--     TooLong      = { fg = hue_5 },
--     WildMenu     = { fg = mono_1, bg = mono_3 },
--     SignColumn   = { fg = none, bg = syntax_bg },
--     Special      = { fg = hue_2 },

-----------------------------
---- Vim Help Highlighting --
-----------------------------

--     helpCommand      = { fg = hue_6_2 },
--     helpExample      = { fg = hue_6_2 },
--     helpHeader       = { fg = mono_1, style = 'bold'},
--     helpSectionDelim = { fg = mono_3,},

------------------------------------
---- Standard Syntax Highlighting --
------------------------------------

--     Comment        = { fg = mono_3,  style = 'italic'},
--     Constant       = { fg = hue_4, bg = none},
--     String         = { fg = hue_4, bg = none},
--     Character      = { fg = hue_4, bg = none},
--     Number         = { fg = hue_6, bg = none},
--     Boolean        = { fg = hue_6, bg = none},
--     Float          = { fg = hue_6, bg = none},
--     Identifier     = { fg = hue_5, bg = none},
--     Function       = { fg = hue_2, bg = none},
--     Statement      = { fg = hue_3, bg = none},
--     Conditional    = { fg = hue_3, bg = none},
--     Repeat         = { fg = hue_3, bg = none},
--     Label          = { fg = hue_3, bg = none},
--     Operator       = { fg = syntax_accent },
--     Keyword        = { fg = hue_5, bg = none},
--     Exception      = { fg = hue_3, bg = none},
--     PreProc        = { fg = hue_6_2, bg = none},
--     Include        = { fg = hue_2, bg = none},
--     Define         = { fg = hue_3, bg = none},
--     Macro          = { fg = hue_3, bg = none},
--     PreCondit      = { fg = hue_6_2, bg = none},
--     Type           = { fg = hue_6_2, bg = none},
--     StorageClass   = { fg = hue_6_2, bg = none},
--     Structure      = { fg = hue_6_2, bg = none},
--     Typedef        = { fg = hue_6_2, bg = none},
--     Special        = { fg = hue_2, bg = none},
--     SpecialChar    = { fg = none},
--     Tag            = { fg = none},
--     Delimiter      = { fg = none},
--     SpecialComment = { fg = none},
--     Debug          = { fg = none},
--     Underlined     = { fg = none, style = 'underline' },
--     Ignore         = { fg = none},
--     Error          = { fg = hue_5, bg = mono_3,   style = 'bold'},
--     Todo           = { fg = hue_3, bg = mono_3 },

-------------------------
---- Diff Highlighting --
-------------------------

--     DiffAdd     = { fg = syntax_color_added, bg = visual_grey},
--     DiffChange  = { fg = syntax_color_modified, bg = visual_grey},
--     DiffDelete  = { fg = syntax_color_removed, bg = visual_grey},
--     DiffText    = { fg = hue_2, bg = visual_grey},
--     DiffAdded   = { fg = hue_4, bg = visual_grey},
--     DiffFile    = { fg = hue_5, bg = visual_grey},
--     DiffNewFile = { fg = hue_4, bg = visual_grey},
--     DiffLine    = { fg = hue_2, bg = visual_grey},
--     DiffRemoved = { fg = hue_5, bg = visual_grey},

-----------------------------
---- Filetype Highlighting --
-----------------------------

---- Asciidoc
--     asciidocListingBlock = { fg = mono_2 },

---- C/C++ highlighting
--     cInclude           = { fg = hue_3 },
--     cPreCondit         = { fg = hue_3 },
--     cPreConditMatch    = { fg = hue_3 },
--     cType              = { fg = hue_3 },
--     cStorageClass      = { fg = hue_3 },
--     cStructure         = { fg = hue_3 },
--     cOperator          = { fg = hue_3 },
--     cStatement         = { fg = hue_3 },
--     cTODO              = { fg = hue_3 },
--     cConstant          = { fg = hue_6 },
--     cSpecial           = { fg = hue_1 },
--     cSpecialCharacter  = { fg = hue_1 },
--     cString            = { fg = hue_4 },
--     cppType            = { fg = hue_3 },
--     cppStorageClass    = { fg = hue_3 },
--     cppStructure       = { fg = hue_3 },
--     cppModifier        = { fg = hue_3 },
--     cppOperator        = { fg = hue_3 },
--     cppAccess          = { fg = hue_3 },
--     cppStatement       = { fg = hue_3 },
--     cppConstant        = { fg = hue_5 },
--     cCppString         = { fg = hue_4 },

---- Cucumber
--     cucumberGiven           = { fg = hue_2 },
--     cucumberWhen            = { fg = hue_2 },
--     cucumberWhenAnd         = { fg = hue_2 },
--     cucumberThen            = { fg = hue_2 },
--     cucumberThenAnd         = { fg = hue_2 },
--     cucumberUnparsed        = { fg = hue_6 },
--     cucumberFeature         = { fg = hue_5, style = 'bold'},
--     cucumberBackground      = { fg = hue_3, style = 'bold'},
--     cucumberScenario        = { fg = hue_3, style = 'bold'},
--     cucumberScenarioOutline = { fg = hue_3, style = 'bold'},
--     cucumberTags            = { fg = mono_3, style = 'bold'},
--     cucumberDelimiter       = { fg = mono_3, style = 'bold'},

---- CSS/Sass
--     cssAttrComma         = { fg = hue_3 },
--     cssAttributeSelector = { fg = hue_4 },
--     cssBraces            = { fg = mono_2 },
--     cssClassName         = { fg = hue_6 },
--     cssClassNameDot      = { fg = hue_6 },
--     cssDefinition        = { fg = hue_3 },
--     cssFontAttr          = { fg = hue_6 },
--     cssFontDescriptor    = { fg = hue_3 },
--     cssFunctionName      = { fg = hue_2 },
--     cssIdentifier        = { fg = hue_2 },
--     cssImportant         = { fg = hue_3 },
--     cssInclude           = { fg = mono_1 },
--     cssIncludeKeyword    = { fg = hue_3 },
--     cssMediaType         = { fg = hue_6 },
--     cssProp              = { fg = hue_1 },
--     cssPseudoClassId     = { fg = hue_6 },
--     cssSelectorOp        = { fg = hue_3 },
--     cssSelectorOp2       = { fg = hue_3 },
--     cssStringQ           = { fg = hue_4 },
--     cssStringQQ          = { fg = hue_4 },
--     cssTagName           = { fg = hue_5 },
--     cssAttr              = { fg = hue_6 },
--     sassAmpersand      = { fg = hue_5 },
--     sassClass          = { fg = hue_6_2 },
--     sassControl        = { fg = hue_3 },
--     sassExtend         = { fg = hue_3 },
--     sassFor            = { fg = mono_1 },
--     sassProperty       = { fg = hue_1 },
--     sassFunction       = { fg = hue_1 },
--     sassId             = { fg = hue_2 },
--     sassInclude        = { fg = hue_3 },
--     sassMedia          = { fg = hue_3 },
--     sassMediaOperators = { fg = mono_1 },
--     sassMixin          = { fg = hue_3 },
--     sassMixinName      = { fg = hue_2 },
--     sassMixing         = { fg = hue_3 },
--     scssSelectorName   = { fg = hue_6_2 },

---- Elixir highlighting
--     elixirModuleDefine      = 'Define',
--     elixirAlias             = { fg = hue_6_2 },
--     elixirAtom              = { fg = hue_1 },
--     elixirBlockDefinition   = { fg = hue_3 },
--     elixirModuleDeclaration = { fg = hue_6 },
--     elixirInclude           = { fg = hue_5 },
--     elixirOperator          = { fg = hue_6 },

---- Git and git related plugins
--     gitcommitComment        = { fg = mono_3 },
--     gitcommitUnmerged       = { fg = hue_4 },
--     gitcommitOnBranch       = { fg = none},
--     gitcommitBranch         = { fg = hue_3 },
--     gitcommitDiscardedType  = { fg = hue_5 },
--     gitcommitSelectedType   = { fg = hue_4 },
--     gitcommitHeader         = { fg = none},
--     gitcommitUntrackedFile  = { fg = hue_1 },
--     gitcommitDiscardedFile  = { fg = hue_5 },
--     gitcommitSelectedFile   = { fg = hue_4 },
--     gitcommitUnmergedFile   = { fg = hue_6_2 },
--     gitcommitFile           = { fg = none},
--     gitcommitNoBranch       = 'gitcommitBranch',
--     gitcommitUntracked      = 'gitcommitComment',
--     gitcommitDiscarded      = 'gitcommitComment',
--     gitcommitDiscardedArrow = 'gitcommitDiscardedFile',
--     gitcommitSelectedArrow  = 'gitcommitSelectedFile',
--     gitcommitUnmergedArrow  = 'gitcommitUnmergedFile',
--     SignifySignAdd          = { fg = syntax_color_added },
--     SignifySignChange       = { fg = syntax_color_modified },
--     SignifySignDelete       = { fg = syntax_color_removed },
--     GitGutterAdd            = 'SignifySignAdd',
--     GitGutterChange         = 'SignifySignChange',
--     GitGutterDelete         = 'SignifySignDelete',
--     GitSignsAdd             = 'SignifySignAdd',
--     GitSignsChange          = 'SignifySignChange',
--     GitSignsDelete          = 'SignifySignDelete',

---- Go
--     goDeclaration  = { fg = hue_3 },
--     goField        = { fg = hue_5 },
--     goMethod       = { fg = hue_1 },
--     goType         = { fg = hue_3 },
--     goUnsignedInts = { fg = hue_1 },

---- Haskell highlighting
--     haskellDeclKeyword    = { fg = hue_2 },
--     haskellType           = { fg = hue_4 },
--     haskellWhere          = { fg = hue_5 },
--     haskellImportKeywords = { fg = hue_2 },
--     haskellOperators      = { fg = hue_5 },
--     haskellDelimiter      = { fg = hue_2 },
--     haskellIdentifier     = { fg = hue_6 },
--     haskellKeyword        = { fg = hue_5 },
--     haskellNumber         = { fg = hue_1 },
--     haskellString         = { fg = hue_1 },

---- HTML
--     htmlArg            = { fg = hue_6 },
--     htmlTagName        = { fg = hue_5 },
--     htmlTagN           = { fg = hue_5 },
--     htmlSpecialTagName = { fg = hue_5 },
--     htmlTag            = { fg = mono_2 },
--     htmlEndTag         = { fg = mono_2 },
--     MatchTag           = { fg = hue_5, bg = syntax_cursor, style = 'bold,underline'},

---- JavaScript
--     coffeeString           = { fg = hue_4 },
--     javaScriptBraces       = { fg = mono_2 },
--     javaScriptFunction     = { fg = hue_3 },
--     javaScriptIdentifier   = { fg = hue_3 },
--     javaScriptNull         = { fg = hue_6 },
--     javaScriptNumber       = { fg = hue_6 },
--     javaScriptRequire      = { fg = hue_1 },
--     javaScriptReserved     = { fg = hue_3 },
---- httpc.//github.com/pangloss/vim-javascript
--     jsArrowFunction        = { fg = hue_3 },
--     jsBraces               = { fg = mono_2 },
--     jsClassBraces          = { fg = mono_2 },
--     jsClassKeywords        = { fg = hue_3 },
--     jsDocParam             = { fg = hue_2 },
--     jsDocTags              = { fg = hue_3 },
--     jsFuncBraces           = { fg = mono_2 },
--     jsFuncCall             = { fg = hue_2 },
--     jsFuncParens           = { fg = mono_2 },
--     jsFunction             = { fg = hue_3 },
--     jsGlobalObjects        = { fg = hue_6_2 },
--     jsModuleWords          = { fg = hue_3 },
--     jsModules              = { fg = hue_3 },
--     jsNoise                = { fg = mono_2 },
--     jsNull                 = { fg = hue_6 },
--     jsOperator             = { fg = hue_3 },
--     jsParens               = { fg = mono_2 },
--     jsStorageClass         = { fg = hue_3 },
--     jsTemplateBraces       = { fg = hue_5_2 },
--     jsTemplateVar          = { fg = hue_4 },
--     jsThis                 = { fg = hue_5 },
--     jsUndefined            = { fg = hue_6 },
--     jsObjectValue          = { fg = hue_2 },
--     jsObjectKey            = { fg = hue_1 },
--     jsReturn               = { fg = hue_3 },
---- httpc.//github.com/othree/yajs.vim
--     javascriptArrowFunc    = { fg = hue_3 },
--     javascriptClassExtends = { fg = hue_3 },
--     javascriptClassKeyword = { fg = hue_3 },
--     javascriptDocNotation  = { fg = hue_3 },
--     javascriptDocParamName = { fg = hue_2 },
--     javascriptDocTags      = { fg = hue_3 },
--     javascriptEndColons    = { fg = mono_3 },
--     javascriptExport       = { fg = hue_3 },
--     javascriptFuncArg      = { fg = mono_1 },
--     javascriptFuncKeyword  = { fg = hue_3 },
--     javascriptIdentifier   = { fg = hue_5 },
--     javascriptImport       = { fg = hue_3 },
--     javascriptObjectLabel  = { fg = mono_1 },
--     javascriptOpSymbol     = { fg = hue_1 },
--     javascriptOpSymbols    = { fg = hue_1 },
--     javascriptPropertyName = { fg = hue_4 },
--     javascriptTemplateSB   = { fg = hue_5_2 },
--     javascriptVariable     = { fg = hue_3 },

---- JSON
--     jsonCommentError       = { fg = mono_1 },
--     jsonKeyword            = { fg = hue_5 },
--     jsonQuote              = { fg = mono_3 },
--     jsonTrailingCommaError = { fg = hue_5, style = 'reverse' },
--     jsonMissingCommaError  = { fg = hue_5, style = 'reverse' },
--     jsonNoQuotesError      = { fg = hue_5, style = 'reverse' },
--     jsonNumError           = { fg = hue_5, style = 'reverse' },
--     jsonString             = { fg = hue_4 },
--     jsonBoolean            = { fg = hue_3 },
--     jsonNumber             = { fg = hue_6 },
--     jsonStringSQError      = { fg = hue_5, style = 'reverse' },
--     jsonSemicolonError     = { fg = hue_5, style = 'reverse' },

---- Markdown
--     markdownUrl              = { fg = mono_3, stlye = 'underline' },
--     markdownBold             = { fg = hue_6, style = 'bold' },
--     markdownItalic           = { fg = hue_6, style = 'italic' },
--     markdownCode             = { fg = hue_4 },
--     markdownCodeBlock        = { fg = hue_5 },
--     markdownCodeDelimiter    = { fg = hue_4 },
--     markdownHeadingDelimiter = { fg = hue_5_2 },
--     markdownH1               = { fg = hue_5 },
--     markdownH2               = { fg = hue_5 },
--     markdownH3               = { fg = hue_5 },
--     markdownH3               = { fg = hue_5 },
--     markdownH4               = { fg = hue_5 },
--     markdownH5               = { fg = hue_5 },
--     markdownH6               = { fg = hue_5 },
--     markdownListMarker       = { fg = hue_5 },

---- PHP
--     phpClass        = { fg = hue_6_2 },
--     phpFunction     = { fg = hue_2 },
--     phpFunctions    = { fg = hue_2 },
--     phpInclude      = { fg = hue_3 },
--     phpKeyword      = { fg = hue_3 },
--     phpParent       = { fg = mono_3 },
--     phpType         = { fg = hue_3 },
--     phpSuperGlobals = { fg = hue_5 },

---- Pug (Formerly Jade)
--     pugAttributesDelimiter = { fg = hue_6 },
--     pugClass               = { fg = hue_6 },
--     pugDocType             = { fg = mono_3, style = 'italic'},
--     pugTag                 = { fg = hue_5 },

---- PureScript
--     purescriptKeyword     = { fg = hue_3 },
--     purescriptModuleName  = { fg = mono_1 },
--     purescriptIdentifier  = { fg = mono_1 },
--     purescriptType        = { fg = hue_6_2 },
--     purescriptTypeVar     = { fg = hue_5 },
--     purescriptConstructor = { fg = hue_5 },
--     purescriptOperator    = { fg = mono_1 },

---- Python
--     pythonImport          = { fg = hue_3 },
--     pythonBuiltin         = { fg = hue_1 },
--     pythonStatement       = { fg = hue_3 },
--     pythonParam           = { fg = hue_6 },
--     pythonEscape          = { fg = hue_5 },
--     pythonSelf            = { fg = mono_2, style = 'italic'},
--     pythonClass           = { fg = hue_2 },
--     pythonOperator        = { fg = hue_3 },
--     pythonEscape          = { fg = hue_5 },
--     pythonFunction        = { fg = hue_2 },
--     pythonKeyword         = { fg = hue_2 },
--     pythonModule          = { fg = hue_3 },
--     pythonStringDelimiter = { fg = hue_4 },
--     pythonSymbol          = { fg = hue_1 },

---- Ruby 
--     rubyBlock                     = { fg = hue_3 },
--     rubyBlockParameter            = { fg = hue_5 },
--     rubyBlockParameterList        = { fg = hue_5 },
--     rubyCapitalizedMethod         = { fg = hue_3 },
--     rubyClass                     = { fg = hue_3 },
--     rubyConstant                  = { fg = hue_6_2 },
--     rubyControl                   = { fg = hue_3 },
--     rubyDefine                    = { fg = hue_3 },
--     rubyEscape                    = { fg = hue_5 },
--     rubyFunction                  = { fg = hue_2 },
--     rubyGlobalVariable            = { fg = hue_5 },
--     rubyInclude                   = { fg = hue_2 },
--     rubyIncluderubyGlobalVariable = { fg = hue_5 },
--     rubyInstanceVariable          = { fg = hue_5 },
--     rubyInterpolation             = { fg = hue_1 },
--     rubyInterpolationDelimiter    = { fg = hue_5 },
--     rubyKeyword                   = { fg = hue_2 },
--     rubyModule                    = { fg = hue_3 },
--     rubyPseudoVariable            = { fg = hue_5 },
--     rubyRegexp                    = { fg = hue_1 },
--     rubyRegexpDelimiter           = { fg = hue_1 },
--     rubyStringDelimiter           = { fg = hue_4 },
--     rubySymbol                    = { fg = hue_1 },

---- Spelling
--     SpellBad   = { fg = mono_3, style = 'undercurl'},
--     SpellLocal = { fg = mono_3, style = 'undercurl'},
--     SpellCap   = { fg = mono_3, style = 'undercurl'},
--     SpellRare  = { fg = mono_3, style = 'undercurl'},

---- Vim
--     vimCommand      = { fg = hue_3 },
--     vimCommentTitle = { fg = mono_3, style = 'bold'},
--     vimFunction     = { fg = hue_1 },
--     vimFuncName     = { fg = hue_3 },
--     vimHighlight    = { fg = hue_2 },
--     vimLineComment  = { fg = mono_3, style = 'italic'},
--     vimParenSep     = { fg = mono_2 },
--     vimSep          = { fg = mono_2 },
--     vimUserFunc     = { fg = hue_1 },
--     vimVar          = { fg = hue_5 },

---- XML
--     xmlAttrib  = { fg = hue_6_2 },
--     xmlEndTag  = { fg = hue_5 },
--     xmlTag     = { fg = hue_5 },
--     xmlTagName = { fg = hue_5 },

---- ZSH
--     zshCommands    = { fg = mono_1 },
--     zshDeref       = { fg = hue_5 },
--     zshShortDeref  = { fg = hue_5 },
--     zshFunction    = { fg = hue_1 },
--     zshKeyword     = { fg = hue_3 },
--     zshSubst       = { fg = hue_5 },
--     zshSubstDelim  = { fg = mono_3 },
--     zshTypes       = { fg = hue_3 },
--     zshVariableDef = { fg = hue_6 },

---- Rust
--     rustExternCrate          = { fg = hue_5,  style = 'bold'},
--     rustIdentifier           = { fg = hue_2 },
--     rustDeriveTrait          = { fg = hue_4 },
--     SpecialComment           = { fg = mono_3 },
--     rustCommentLine          = { fg = mono_3 },
--     rustCommentLineDoc       = { fg = mono_3 },
--     rustCommentLineDocError  = { fg = mono_3 },
--     rustCommentBlock         = { fg = mono_3 },
--     rustCommentBlockDoc      = { fg = mono_3 },
--     rustCommentBlockDocError = { fg = mono_3 },

---- Man
--     manTitle  = 'String',
--     manFooter = { fg = mono_3 },

---------------------------
---- Plugin Highlighting --
---------------------------

---- ALE (Asynchronous Lint Engine)
--     ALEWarningSign = { fg = hue_6_2 },
--     ALEErrorSign   = { fg = hue_5 },

---- Neovim NERDTree Background fix
--     NERDTreeFile = { fg = mono_1 },

---- Coc.nvim
--CocFloating = { bg = none },
--NormalFloating = { bg = none },

-------------------------------
----     LSP Highlighting    --
-------------------------------

--LspDiagnosticsDefaultError           = { fg = hue_5 },
--LspDiagnosticsDefaultWarning         = { fg = hue_6_2 },
--LspDiagnosticsDefaultInformation     = { fg = hue_1 },
--LspDiagnosticsDefaultHint            = { fg = hue_4 },
--LspDiagnosticsVirtualTextError       = { fg = hue_5 },
--LspDiagnosticsVirtualTextWarning     = { fg = hue_6_2 },
--LspDiagnosticsVirtualTextInformation = { fg = hue_1 },
--LspDiagnosticsVirtualTextHint        = { fg = hue_4 },
--LspDiagnosticsUnderlineError         = { fg = hue_5 , style = 'underline' },
--LspDiagnosticsUnderlineWarning       = { fg = hue_6_2 , style = 'underline' },
--LspDiagnosticsUnderlineInformation   = { fg = hue_1 , style = 'underline' },
--LspDiagnosticsUnderlineHint          = { fg = hue_4 , style = 'underline' },
--LspDiagnosticsFloatingError          = { fg = hue_5 , bg = pmenu },
--LspDiagnosticsFloatingWarning        = { fg = hue_6_2 , bg = pmenu },
--LspDiagnosticsFloatingInformation    = { fg = hue_1 , bg = pmenu },
--LspDiagnosticsFloatingHint           = { fg = hue_4 , bg = pmenu },
--LspDiagnosticsSignError              = { fg = hue_5 },
--LspDiagnosticsSignWarning            = { fg = hue_6_2 },
--LspDiagnosticsSignInformation        = { fg = hue_1 },
--LspDiagnosticsSignHint               = { fg = hue_4 },
--LspReferenceText                     = { style = 'reverse' },
--LspReferenceRead                     = { style = 'reverse' },
--LspReferenceWrite                    = { fg = hue_6_2, style = 'reverse' },

-------------------------------
---- TreeSitter Highlighting --
-------------------------------

--     TSAnnotation         = 'PreProc',
--     TSAttribute          = 'PreProc',
--     TSBoolean            = 'Boolean',
--     TSCharacter          = 'Character',
--     TSComment            = 'Comment',
--     TSConditional        = 'Conditional',
--     TSConstant           = 'Constant',
--     TSConstBuiltin       = 'Special',
--     TSConstMacro         = 'Define',
--     TSConstructor        = 'Special',
--     TSEmphasis           = 'Italic',
--     TSError              = 'Error',
--     TSException          = 'Exception',
--     TSField              = 'Identifier',
--     TSFloat              = 'Float',
--     TSFunction           = 'Function',
--     TSFuncBuiltin        = 'Special',
--     TSFuncMacro          = 'Macro',
--     TSInclude            = 'Include',
--     TSKeyword            = 'Keyword',
--     TSKeywordFunction    = 'Keyword',
--     TSKeywordOperator    = 'Operator',
--     TSLabel              = 'Label',
--     TSLiteral            = 'String',
--     TSMethod             = 'Function',
--     TSNamespace          = 'Include',
--     TSNumber             = 'Number',
--     TSOperator           = 'Operator',
--     TSParameter          = 'Identifier',
--     TSParameterReference = 'Identifier',
--     TSProperty           = 'Identifier',
--     TSPunctBracket       = 'Delimiter',
--     TSPunctDelimiter     = 'Delimiter',
--     TSPunctSpecial       = 'Delimiter',
--     TSRepeat             = 'Repeat',
--     TSString             = 'String',
--     TSStringEscape       = 'SpecialChar',
--     TSStringRegex        = 'String',
--     TSStrong             = 'bold',
--     TSTag                = 'Label',
--     TSTagDelimiter       = 'Label',
--     -- TSText               = { fg = hue_6_2 },
--     TSTitle              = 'Title',
--     TSType               = 'Type',
--     TSTypeBuiltin        = 'Type',
--     TSUnderline          = 'Underlined',
--     TSURI                = 'Underlined',
--     TSVariableBuiltin    = 'Special',

--}

local terminal_ansi_colors = {
    [0]  = black,
    [1]  = blood_red,
    [2]  = dark_green,
    [3]  = bright_yellow,
    [4]  = light_blue,
    [5]  = magenta,
    [6]  = light_blue,
    [7]  = white,
    [8]  = black,
    [9]  = dark_red,
    [10] = light_green,
    [11] = yellow,
    [12] = bright_blue,
    [13] = magenta,
    [14] = light_blue,
    [15] = white
}


require(vim.g.colors_name)(highlight_group_normal, highlight_groups, terminal_ansi_colors)

-- Thanks to Iron-E (https://github.com/Iron-E) for the template (Iron-E/nvim-highlite).
-- vim: ft=lua