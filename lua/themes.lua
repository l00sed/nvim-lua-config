-- Themes
local cmd = vim.cmd
local set_hl = vim.api.nvim_set_hl
local autocmd = vim.api.nvim_create_autocmd
local utils = require('utils')

local theme = {
  -- grays
  ["gray-0"] =  '#eeeeee',
  ["gray-5"] =  '#cccccc',
	["gray-10"] =  '#aaaaaa',
	["gray-15"] =  '#a3a3a3',
	["gray-25"] =  '#999999',
	["gray-55"] =  '#555555',
	["gray-80"] =  '#3a3a3a',
	["gray-85"] =  '#333333',
	["gray-95"] =  '#222222',
  ["gray-100"] = '#111111',
  -- greens
  ["green-25"] = '#B8BB26',
  -- yellows
  ["yellow-25"] = '#FABD2F',
  -- oranges
  ["orange-25"] = '#FE8019',
  -- reds
  ["red-25"] = '#FB4934',
  -- purples
  ["purple-25"] = '#D3869B',
  -- blues
  ["blue-25"] = '#83A598',
  -- aquas
  ["aqua-25"] = '#8EC07C',
}

if os.getenv("THEME_VARIANT") == 'light' then
  for i, color in pairs(theme) do
    theme[i] = utils.invert_hex_color(color)
  end
end

-- Lualine transparent bg
set_hl(0, 'lualine_transitional_lualine_a_replace_to_StatusLine', { bg = 'none' })
set_hl(0, 'lualine_transitional_lualine_a_insert_to_StatusLine', { bg = 'none' })
set_hl(0, 'lualine_transitional_lualine_a_normal_to_StatusLine', { bg = 'none' })
set_hl(0, 'lualine_transitional_lualine_a_command_to_StatusLine', { bg = 'none' })
set_hl(0, 'lualine_transitional_lualine_a_visual_to_StatusLine', { bg = 'none' })

-- LSP Diagnostics
cmd [[
sign define DiagnosticSignError text= texthl=DiagnosticError linehl= numhl=
sign define DiagnosticSignWarn  text= texthl=DiagnosticWarn  linehl= numhl=
sign define DiagnosticSignInfo  text= texthl=DiagnosticInfo  linehl= numhl=
sign define DiagnosticSignHint  text= texthl=DiagnosticHint  linehl= numhl=
]]
set_hl(0, 'DiagnosticError', { fg = 'red', bg = 'none' })
set_hl(0, 'DiagnosticWarn', { fg = 'orange', bg = 'none' })
set_hl(0, 'DiagnosticInfo', { fg = 'teal', bg = 'none' })
set_hl(0, 'DiagnosticHint', { fg = 'white', bg = 'none' })

-- Bufferline Transparency
set_hl(0, 'BufferLineNumbersSelected', { bg = 'none', fg = 'white' })
set_hl(0, 'BufferLineBufferSelected', { fg = white, bg = 'none' })
set_hl(0, 'BufferLineDiagnosticSelected', { bg = 'none' })
set_hl(0, 'BufferLineHintSelected', { bg = 'none' })
set_hl(0, 'BufferLineHintDiagnosticSelected', { bg = 'none' })
set_hl(0, 'BufferLineInfoSelected', { bg = 'none' })
set_hl(0, 'BufferLineInfoDiagnosticSelected', { bg = 'none' })
set_hl(0, 'BufferLineWarningSelected', { bg = 'none' })
set_hl(0, 'BufferLineWarningDiagnosticSelected', { bg = 'none' })
set_hl(0, 'BufferLineErrorSelected', { bg = 'none' })
set_hl(0, 'BufferLineErrorDiagnosticSelected', { bg = 'none' })
set_hl(0, 'BufferLineModifiedSelected', { bg = 'none' })
set_hl(0, 'BufferLineModifiedDiagnosticSelected', { bg = 'none' })
set_hl(0, 'BufferLineDuplicateSelected', { bg = 'none' })
set_hl(0, 'BufferLineSeparatorSelected', { fg = '#000000', bg = 'none' })

-- Dropbar Transparency
set_hl(0, 'WinBar', { bg = 'none', ctermbg = 'None' })

-- Barbar Tabs Trasparency
set_hl(0, 'TabLine', { bg = 'none', ctermbg = 'None' })
set_hl(0, 'TabLineSel', { fg = theme['gray-5'], bg = 'none', ctermbg = 'None' })
set_hl(0, 'TabLineFill', { bg = 'none', ctermbg = 'None' })
set_hl(0, 'StatusLine', { fg = theme['gray-55'], bg = 'none', ctermbg = 'None' })
set_hl(0, 'StatusLineNC', { fg = theme['gray-55'], bg = 'none', ctermbg = 'None' })

-- Extra HTML syntax highlighting
set_hl(0, 'htmlArg', { italic = true })
set_hl(0, 'htmlBold', { bold = true })
set_hl(0, 'htmlItalic', { italic = true })
set_hl(0, 'htmlBoldItalic', { bold = true, italic = true })

-- Additional Transparency
set_hl(0, 'Normal', { bg = 'none', ctermbg = 'None' })
set_hl(0, 'SignColumn', { bg = 'none' })
set_hl(0, 'Pmenu', { bg = 'none', ctermbg = 'None' })
set_hl(0, 'NonText', { fg = 'gray', bg = 'none' })
set_hl(0, 'NormalFloat', { bg = 'none', ctermbg = 'None' })

-- Git signs column plugin
set_hl(0, 'MarkviewCode', { bg = theme['gray-100'] })
set_hl(0, 'MarkviewCodeInfo', { fg = theme['gray-55'], bg = theme['gray-100'] })
set_hl(0, 'MarkviewInlineCode', { fg = theme['orange-25'], bg = theme['gray-95'] })
set_hl(0, 'MarkviewHeading1', { fg = '#000000', bg = theme['green-25'] })
set_hl(0, 'MarkviewHeading2', { fg = '#000000', bg = theme['yellow-25'] })
set_hl(0, 'MarkviewHeading3', { fg = '#000000', bg = theme['orange-25'] })
set_hl(0, 'MarkviewHeading4', { fg = '#000000', bg = theme['red-25'] })
set_hl(0, 'MarkviewHeading5', { fg = '#000000', bg = theme['purple-25'] })
set_hl(0, 'MarkviewHeading6', { fg = '#000000', bg = theme['blue-25'] })

-- Italic comments
set_hl(0, 'Comment', { bg = 'none', fg = theme['gray-55'], italic = true })

-- Spelling
set_hl(0, 'SpellBad', { undercurl = true })
set_hl(0, 'SpellRare', { undercurl = true })
set_hl(0, 'SpellCap', { undercurl = true })
set_hl(0, 'SpellLocal', { undercurl = true })

-- Tab Icons
set_hl(0, 'DevIconDiffCurrent', { bg = 'none', ctermbg= 'None', fg = '#41535b' })
set_hl(0, 'DevIconElmCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconJlCurrent', { bg = 'none', ctermbg= 'None', fg = '#a270ba' })
set_hl(0, 'DevIconDockerfileCurrent', { bg = 'none', ctermbg= 'None', fg = '#458ee6' })
set_hl(0, 'DevIconXcPlaygroundCurrent', { bg = 'none', ctermbg= 'None', fg = '#e37933' })
set_hl(0, 'DevIconSlnCurrent', { bg = 'none', ctermbg= 'None', fg = '#854cc7' })
set_hl(0, 'DevIconTclCurrent', { bg = 'none', ctermbg= 'None', fg = '#1e5cb3' })
set_hl(0, 'DevIconFsxCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconTexCurrent', { bg = 'none', ctermbg= 'None', fg = '#3d6117' })
set_hl(0, 'DevIconLuaCurrent', { bg = 'none', ctermbg= 'None', fg = '#51a0cf' })
set_hl(0, 'DevIconJsxCurrent', { bg = 'none', ctermbg= 'None', fg = '#20c2e3' })
set_hl(0, 'DevIconWasmCurrent', { bg = 'none', ctermbg= 'None', fg = '#5c4cdb' })
set_hl(0, 'DevIconValaCurrent', { bg = 'none', ctermbg= 'None', fg = '#7239b3' })
set_hl(0, 'DevIconGemfileCurrent', { bg = 'none', ctermbg= 'None', fg = '#701516' })
set_hl(0, 'DevIconNPMrcCurrent', { bg = 'none', ctermbg= 'None', fg = '#e8274b' })
set_hl(0, 'DevIconPlCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconMlCurrent', { bg = 'none', ctermbg= 'None', fg = '#e37933' })
set_hl(0, 'DevIconMarkdownCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconCpCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconLogCurrent', { bg = 'none', ctermbg= 'None', fg = '#ffffff' })
set_hl(0, 'DevIconPycCurrent', { bg = 'none', ctermbg= 'None', fg = '#ffe291' })
set_hl(0, 'DevIconCppCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconEppCurrent', { bg = 'none', ctermbg= 'None', fg = '#ffa61a' })
set_hl(0, 'DevIconGitConfigCurrent', { bg = 'none', ctermbg= 'None', fg = '#41535b' })
set_hl(0, 'DevIconDesktopEntryCurrent', { bg = 'none', ctermbg= 'None', fg = '#563d7c' })
set_hl(0, 'DevIconClojureCurrent', { bg = 'none', ctermbg= 'None', fg = '#8dc149' })
set_hl(0, 'DevIconLiquidCurrent', { bg = 'none', ctermbg= 'None', fg = '#95bf47' })
set_hl(0, 'DevIconHppCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconKotlinScriptCurrent', { bg = 'none', ctermbg= 'None', fg = '#7f52ff' })
set_hl(0, 'DevIconBrewfileCurrent', { bg = 'none', ctermbg= 'None', fg = '#701516' })
set_hl(0, 'DevIconExCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconMliCurrent', { bg = 'none', ctermbg= 'None', fg = '#e37933' })
set_hl(0, 'DevIconEexCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconGitModulesCurrent', { bg = 'none', ctermbg= 'None', fg = '#41535b' })
set_hl(0, 'DevIconEdnCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconGodotProjectCurrent', { bg = 'none', ctermbg= 'None', fg = '#6d8086' })
set_hl(0, 'DevIconSvgCurrent', { bg = 'none', ctermbg= 'None', fg = '#ffb13b' })
set_hl(0, 'DevIconXulCurrent', { bg = 'none', ctermbg= 'None', fg = '#e37933' })
set_hl(0, 'DevIconDartCurrent', { bg = 'none', ctermbg= 'None', fg = '#03589c' })
set_hl(0, 'DevIconCMakeCurrent', { bg = 'none', ctermbg= 'None', fg = '#6d8086' })
set_hl(0, 'DevIconOrgModeCurrent', { bg = 'none', ctermbg= 'None', fg = '#77aa99' })
set_hl(0, 'DevIconTextSceneCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconHxxCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconBazelCurrent', { bg = 'none', ctermbg= 'None', fg = '#89e051' })
set_hl(0, 'DevIconCobolCurrent', { bg = 'none', ctermbg= 'None', fg = '#005ca5' })
set_hl(0, 'DevIconCxxCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconGitLogoCurrent', { bg = 'none', ctermbg= 'None', fg = '#f14c28' })
set_hl(0, 'DevIconJpegCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconWebpackCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconTomlCurrent', { bg = 'none', ctermbg= 'None', fg = '#6d8086' })
set_hl(0, 'DevIconDocCurrent', { bg = 'none', ctermbg= 'None', fg = '#185abd' })
set_hl(0, 'DevIconLessCurrent', { bg = 'none', ctermbg= 'None', fg = '#563d7c' })
set_hl(0, 'DevIconPptCurrent', { bg = 'none', ctermbg= 'None', fg = '#cb4a32' })
set_hl(0, 'DevIconBmpCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconSqlCurrent', { bg = 'none', ctermbg= 'None', fg = '#dad8d8' })
set_hl(0, 'DevIconGitCommitCurrent', { bg = 'none', ctermbg= 'None', fg = '#41535b' })
set_hl(0, 'DevIconPrismaCurrent', { bg = 'none', ctermbg= 'None', fg = '#ffffff' })
set_hl(0, 'DevIconRlibCurrent', { bg = 'none', ctermbg= 'None', fg = '#dea584' })
set_hl(0, 'DevIconBzlCurrent', { bg = 'none', ctermbg= 'None', fg = '#89e051' })
set_hl(0, 'DevIconEnvCurrent', { bg = 'none', ctermbg= 'None', fg = '#faf743' })
set_hl(0, 'DevIconFsharpCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconReScriptInterfaceCurrent', { bg = 'none', ctermbg= 'None', fg = '#f55385' })
set_hl(0, 'DevIconLicenseCurrent', { bg = 'none', ctermbg= 'None', fg = '#cbcb41' })
set_hl(0, 'DevIconYmlCurrent', { bg = 'none', ctermbg= 'None', fg = '#6d8086' })
set_hl(0, 'DevIconXmlCurrent', { bg = 'none', ctermbg= 'None', fg = '#e37933' })
set_hl(0, 'DevIconGvimrcCurrent', { bg = 'none', ctermbg= 'None', fg = '#019833' })
set_hl(0, 'DevIconTwigCurrent', { bg = 'none', ctermbg= 'None', fg = '#8dc149' })
set_hl(0, 'DevIconMjsCurrent', { bg = 'none', ctermbg= 'None', fg = '#f1e05a' })
set_hl(0, 'DevIconSmlCurrent', { bg = 'none', ctermbg= 'None', fg = '#e37933' })
set_hl(0, 'DevIconCjsCurrent', { bg = 'none', ctermbg= 'None', fg = '#cbcb41' })
set_hl(0, 'DevIconHeexCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconCsonCurrent', { bg = 'none', ctermbg= 'None', fg = '#cbcb41' })
set_hl(0, 'DevIconDsStoreCurrent', { bg = 'none', ctermbg= 'None', fg = '#41535b' })
set_hl(0, 'DevIconVagrantfileCurrent', { bg = 'none', ctermbg= 'None', fg = '#1563ff' })
set_hl(0, 'DevIconMixLockCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconDropboxCurrent', { bg = 'none', ctermbg= 'None', fg = '#0061fe' })
set_hl(0, 'DevIconCMakeListsCurrent', { bg = 'none', ctermbg= 'None', fg = '#6d8086' })
set_hl(0, 'DevIconExsCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconBinaryGLTFCurrent', { bg = 'none', ctermbg= 'None', fg = '#ffb13b' })
set_hl(0, 'DevIconTypeScriptReactSpecCurrent', { bg = 'none', ctermbg= 'None', fg = '#1354bf' })
set_hl(0, 'DevIconDumpCurrent', { bg = 'none', ctermbg= 'None', fg = '#dad8d8' })
set_hl(0, 'DevIconZshprofileCurrent', { bg = 'none', ctermbg= 'None', fg = '#89e051' })
set_hl(0, 'DevIconPsbCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconTextResourceCurrent', { bg = 'none', ctermbg= 'None', fg = '#cbcb41' })
set_hl(0, 'DevIconSuoCurrent', { bg = 'none', ctermbg= 'None', fg = '#854cc7' })
set_hl(0, 'DevIconNimCurrent', { bg = 'none', ctermbg= 'None', fg = '#f3d400' })
set_hl(0, 'DevIconWebmanifestCurrent', { bg = 'none', ctermbg= 'None', fg = '#f1e05a' })
set_hl(0, 'DevIconPackageLockJsonCurrent', { bg = 'none', ctermbg= 'None', fg = '#7a0d21' })
set_hl(0, 'DevIconEslintrcCurrent', { bg = 'none', ctermbg= 'None', fg = '#4b32c3' })
set_hl(0, 'DevIconLeexCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconMintCurrent', { bg = 'none', ctermbg= 'None', fg = '#87c095' })
set_hl(0, 'DevIconTestJsCurrent', { bg = 'none', ctermbg= 'None', fg = '#cbcb41' })
set_hl(0, 'DevIconWebpCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconVHDLCurrent', { bg = 'none', ctermbg= 'None', fg = '#019833' })
set_hl(0, 'DevIconSystemVerilogCurrent', { bg = 'none', ctermbg= 'None', fg = '#019833' })
set_hl(0, 'DevIconPsdCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconBabelrcCurrent', { bg = 'none', ctermbg= 'None', fg = '#cbcb41' })
set_hl(0, 'DevIconHrlCurrent', { bg = 'none', ctermbg= 'None', fg = '#b83998' })
set_hl(0, 'DevIconRbCurrent', { bg = 'none', ctermbg= 'None', fg = '#701516' })
set_hl(0, 'DevIconGitlabCICurrent', { bg = 'none', ctermbg= 'None', fg = '#e24329' })
set_hl(0, 'DevIconMakefileCurrent', { bg = 'none', ctermbg= 'None', fg = '#6d8086' })
set_hl(0, 'DevIconBashProfileCurrent', { bg = 'none', ctermbg= 'None', fg = '#89e051' })
set_hl(0, 'DevIconGitAttributesCurrent', { bg = 'none', ctermbg= 'None', fg = '#41535b' })
set_hl(0, 'DevIconClojureCCurrent', { bg = 'none', ctermbg= 'None', fg = '#8dc149' })
set_hl(0, 'DevIconTerraformCurrent', { bg = 'none', ctermbg= 'None', fg = '#5f43e9' })
set_hl(0, 'DevIconPrologCurrent', { bg = 'none', ctermbg= 'None', fg = '#e4b854' })
set_hl(0, 'DevIconFennelCurrent', { bg = 'none', ctermbg= 'None', fg = '#fff3d7' })
set_hl(0, 'DevIconJson5Current', { bg = 'none', ctermbg= 'None', fg = '#cbcb41' })
set_hl(0, 'DevIconTxtCurrent', { bg = 'none', ctermbg= 'None', fg = '#89e051' })
set_hl(0, 'DevIconRCurrent', { bg = 'none', ctermbg= 'None', fg = '#358a5b' })
set_hl(0, 'DevIconZshrcCurrent', { bg = 'none', ctermbg= 'None', fg = '#89e051' })
set_hl(0, 'DevIconDocxCurrent', { bg = 'none', ctermbg= 'None', fg = '#185abd' })
set_hl(0, 'DevIconJsonCurrent', { bg = 'none', ctermbg= 'None', fg = '#cbcb41' })
set_hl(0, 'DevIconGifCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconRmdCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconXlsxCurrent', { bg = 'none', ctermbg= 'None', fg = '#207245' })
set_hl(0, 'DevIconZshCurrent', { bg = 'none', ctermbg= 'None', fg = '#89e051' })
set_hl(0, 'DevIconVerilogCurrent', { bg = 'none', ctermbg= 'None', fg = '#019833' })
set_hl(0, 'DevIconCrystalCurrent', { bg = 'none', ctermbg= 'None', fg = '#c8c8c8' })
set_hl(0, 'DevIconJpgCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconSpecJsCurrent', { bg = 'none', ctermbg= 'None', fg = '#cbcb41' })
set_hl(0, 'DevIconBazelBuildCurrent', { bg = 'none', ctermbg= 'None', fg = '#89e051' })
set_hl(0, 'DevIconJavaScriptReactTestCurrent', { bg = 'none', ctermbg= 'None', fg = '#20c2e3' })
set_hl(0, 'DevIconFsscriptCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconSigCurrent', { bg = 'none', ctermbg= 'None', fg = '#e37933' })
set_hl(0, 'DevIconZigCurrent', { bg = 'none', ctermbg= 'None', fg = '#f69a1b' })
set_hl(0, 'DevIconSvelteCurrent', { bg = 'none', ctermbg= 'None', fg = '#ff3e00' })
set_hl(0, 'DevIconCCurrent', { bg = 'none', ctermbg= 'None', fg = '#599eff' })
set_hl(0, 'DevIconEjsCurrent', { bg = 'none', ctermbg= 'None', fg = '#cbcb41' })
set_hl(0, 'DevIconGruntfileCurrent', { bg = 'none', ctermbg= 'None', fg = '#e37933' })
set_hl(0, 'DevIconZshenvCurrent', { bg = 'none', ctermbg= 'None', fg = '#89e051' })
set_hl(0, 'DevIconBazelWorkspaceCurrent', { bg = 'none', ctermbg= 'None', fg = '#89e051' })
set_hl(0, 'DevIconCPlusPlusCurrent', { bg = 'none', ctermbg= 'None', fg = '#f34b7d' })
set_hl(0, 'DevIconSettingsJsonCurrent', { bg = 'none', ctermbg= 'None', fg = '#854cc7' })
set_hl(0, 'DevIconImportConfigurationCurrent', { bg = 'none', ctermbg= 'None', fg = '#ececec' })
set_hl(0, 'DevIconVimrcCurrent', { bg = 'none', ctermbg= 'None', fg = '#019833' })
set_hl(0, 'DevIconHtmlCurrent', { bg = 'none', ctermbg= 'None', fg = '#e44d26' })
set_hl(0, 'DevIconSwiftCurrent', { bg = 'none', ctermbg= 'None', fg = '#e37933' })
set_hl(0, 'DevIconClojureDartCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconStylCurrent', { bg = 'none', ctermbg= 'None', fg = '#8dc149' })
set_hl(0, 'DevIconLhsCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconScalaCurrent', { bg = 'none', ctermbg= 'None', fg = '#cc3e44' })
set_hl(0, 'DevIconTerminalCurrent', { bg = 'none', ctermbg= 'None', fg = '#31b53e' })
set_hl(0, 'DevIconGulpfileCurrent', { bg = 'none', ctermbg= 'None', fg = '#cc3e44' })
set_hl(0, 'DevIconCoffeeCurrent', { bg = 'none', ctermbg= 'None', fg = '#cbcb41' })
set_hl(0, 'DevIconSolidityCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconPsScriptModulefileCurrent', { bg = 'none', ctermbg= 'None', fg = '#6975c4' })
set_hl(0, 'DevIconHamlCurrent', { bg = 'none', ctermbg= 'None', fg = '#eaeae1' })
set_hl(0, 'DevIconNPMIgnoreCurrent', { bg = 'none', ctermbg= 'None', fg = '#e8274b' })
set_hl(0, 'DevIconXlsCurrent', { bg = 'none', ctermbg= 'None', fg = '#207245' })
set_hl(0, 'DevIconAwkCurrent', { bg = 'none', ctermbg= 'None', fg = '#4d5a5e' })
set_hl(0, 'DevIconGoCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconScssCurrent', { bg = 'none', ctermbg= 'None', fg = '#f55385' })
set_hl(0, 'DevIconTFVarsCurrent', { bg = 'none', ctermbg= 'None', fg = '#5f43e9' })
set_hl(0, 'DevIconRsCurrent', { bg = 'none', ctermbg= 'None', fg = '#dea584' })
set_hl(0, 'DevIconPhpCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconHtmCurrent', { bg = 'none', ctermbg= 'None', fg = '#e34c26' })
set_hl(0, 'DevIconTsCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconPngCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconMotokoCurrent', { bg = 'none', ctermbg= 'None', fg = '#9772fb' })
set_hl(0, 'DevIconReScriptCurrent', { bg = 'none', ctermbg= 'None', fg = '#cc3e44' })
set_hl(0, 'DevIconDefaultCurrent', { bg = 'none', ctermbg= 'None', fg = '#6d8086' })
set_hl(0, 'DevIconsbtCurrent', { bg = 'none', ctermbg= 'None', fg = '#cc3e44' })
set_hl(0, 'DevIconProcfileCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconRssCurrent', { bg = 'none', ctermbg= 'None', fg = '#fb9d3b' })
set_hl(0, 'DevIconCsCurrent', { bg = 'none', ctermbg= 'None', fg = '#596706' })
set_hl(0, 'DevIconFsCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconKotlinCurrent', { bg = 'none', ctermbg= 'None', fg = '#7f52ff' })
set_hl(0, 'DevIconBatCurrent', { bg = 'none', ctermbg= 'None', fg = '#c1f12e' })
set_hl(0, 'DevIconHbsCurrent', { bg = 'none', ctermbg= 'None', fg = '#f0772b' })
set_hl(0, 'DevIconJsCurrent', { bg = 'none', ctermbg= 'None', fg = '#cbcb41' })
set_hl(0, 'DevIconMdxCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconHsCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconKshCurrent', { bg = 'none', ctermbg= 'None', fg = '#4d5a5e' })
set_hl(0, 'DevIconGraphQLCurrent', { bg = 'none', ctermbg= 'None', fg = '#e535ab' })
set_hl(0, 'DevIconBashrcCurrent', { bg = 'none', ctermbg= 'None', fg = '#89e051' })
set_hl(0, 'DevIconOPUSCurrent', { bg = 'none', ctermbg= 'None', fg = '#f88a02' })
set_hl(0, 'DevIconCshCurrent', { bg = 'none', ctermbg= 'None', fg = '#4d5a5e' })
set_hl(0, 'DevIconCssCurrent', { bg = 'none', ctermbg= 'None', fg = '#42a5f5' })
set_hl(0, 'DevIconFortranCurrent', { bg = 'none', ctermbg= 'None', fg = '#734f96' })
set_hl(0, 'DevIconConfigurationCurrent', { bg = 'none', ctermbg= 'None', fg = '#ececec' })
set_hl(0, 'DevIconGemspecCurrent', { bg = 'none', ctermbg= 'None', fg = '#701516' })
set_hl(0, 'DevIconPmCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconConfigRuCurrent', { bg = 'none', ctermbg= 'None', fg = '#701516' })
set_hl(0, 'DevIconTestTsCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconPackageJsonCurrent', { bg = 'none', ctermbg= 'None', fg = '#e8274b' })
set_hl(0, 'DevIconErlCurrent', { bg = 'none', ctermbg= 'None', fg = '#b83998' })
set_hl(0, 'DevIconDroolsCurrent', { bg = 'none', ctermbg= 'None', fg = '#ffafaf' })
set_hl(0, 'DevIconQueryCurrent', { bg = 'none', ctermbg= 'None', fg = '#90a850' })
set_hl(0, 'DevIconSchemeCurrent', { bg = 'none', ctermbg= 'None', fg = '#000000' })
set_hl(0, 'DevIconDbCurrent', { bg = 'none', ctermbg= 'None', fg = '#dad8d8' })
set_hl(0, 'DevIconPyCurrent', { bg = 'none', ctermbg= 'None', fg = '#ffbc03' })
set_hl(0, 'DevIconMaterialCurrent', { bg = 'none', ctermbg= 'None', fg = '#b83998' })
set_hl(0, 'DevIconIniCurrent', { bg = 'none', ctermbg= 'None', fg = '#6d8086' })
set_hl(0, 'DevIconDCurrent', { bg = 'none', ctermbg= 'None', fg = '#427819' })
set_hl(0, 'DevIconOpenTypeFontCurrent', { bg = 'none', ctermbg= 'None', fg = '#ececec' })
set_hl(0, 'DevIconRakeCurrent', { bg = 'none', ctermbg= 'None', fg = '#701516' })
set_hl(0, 'DevIconLockCurrent', { bg = 'none', ctermbg= 'None', fg = '#bbbbbb' })
set_hl(0, 'DevIconClojureJSCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconBashCurrent', { bg = 'none', ctermbg= 'None', fg = '#89e051' })
set_hl(0, 'DevIconIcoCurrent', { bg = 'none', ctermbg= 'None', fg = '#cbcb41' })
set_hl(0, 'DevIconAiCurrent', { bg = 'none', ctermbg= 'None', fg = '#cbcb41' })
set_hl(0, 'DevIconRprojCurrent', { bg = 'none', ctermbg= 'None', fg = '#358a5b' })
set_hl(0, 'DevIconVueCurrent', { bg = 'none', ctermbg= 'None', fg = '#8dc149' })
set_hl(0, 'DevIconGDScriptCurrent', { bg = 'none', ctermbg= 'None', fg = '#6d8086' })
set_hl(0, 'DevIconGitIgnoreCurrent', { bg = 'none', ctermbg= 'None', fg = '#41535b' })
set_hl(0, 'DevIconJavaCurrent', { bg = 'none', ctermbg= 'None', fg = '#cc3e44' })
set_hl(0, 'DevIconFaviconCurrent', { bg = 'none', ctermbg= 'None', fg = '#cbcb41' })
set_hl(0, 'DevIconHCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconPdfCurrent', { bg = 'none', ctermbg= 'None', fg = '#b30b00' })
set_hl(0, 'DevIconPydCurrent', { bg = 'none', ctermbg= 'None', fg = '#ffe291' })
set_hl(0, 'DevIconNodeModulesCurrent', { bg = 'none', ctermbg= 'None', fg = '#e8274b' })
set_hl(0, 'DevIconSassCurrent', { bg = 'none', ctermbg= 'None', fg = '#f55385' })
set_hl(0, 'DevIconNixCurrent', { bg = 'none', ctermbg= 'None', fg = '#7ebae4' })
set_hl(0, 'DevIconLuauCurrent', { bg = 'none', ctermbg= 'None', fg = '#51a0cf' })
set_hl(0, 'DevIconYamlCurrent', { bg = 'none', ctermbg= 'None', fg = '#6d8086' })
set_hl(0, 'DevIconPsScriptfileCurrent', { bg = 'none', ctermbg= 'None', fg = '#4273ca' })
set_hl(0, 'DevIconSpecTsCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconHhCurrent', { bg = 'none', ctermbg= 'None', fg = '#a074c4' })
set_hl(0, 'DevIconCsvCurrent', { bg = 'none', ctermbg= 'None', fg = '#89e051' })
set_hl(0, 'DevIconPyoCurrent', { bg = 'none', ctermbg= 'None', fg = '#ffe291' })
set_hl(0, 'DevIconVimCurrent', { bg = 'none', ctermbg= 'None', fg = '#019833' })
set_hl(0, 'DevIconMdCurrent', { bg = 'none', ctermbg= 'None', fg = '#ffffff' })
set_hl(0, 'DevIconPsManifestfileCurrent', { bg = 'none', ctermbg= 'None', fg = '#6975c4' })
set_hl(0, 'DevIconSlimCurrent', { bg = 'none', ctermbg= 'None', fg = '#e34c26' })
set_hl(0, 'DevIconFishCurrent', { bg = 'none', ctermbg= 'None', fg = '#4d5a5e' })
set_hl(0, 'DevIconJavaScriptReactSpecCurrent', { bg = 'none', ctermbg= 'None', fg = '#20c2e3' })
set_hl(0, 'DevIconMustacheCurrent', { bg = 'none', ctermbg= 'None', fg = '#e37933' })
set_hl(0, 'DevIconFsiCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconTorCurrent', { bg = 'none', ctermbg= 'None', fg = '#519aba' })
set_hl(0, 'DevIconRakefileCurrent', { bg = 'none', ctermbg= 'None', fg = '#701516' })
set_hl(0, 'DevIconTypeScriptReactTestCurrent', { bg = 'none', ctermbg= 'None', fg = '#1354bf' })
set_hl(0, 'DevIconPackedResourceCurrent', { bg = 'none', ctermbg= 'None', fg = '#6d8086' })
set_hl(0, 'DevIconErbCurrent', { bg = 'none', ctermbg= 'None', fg = '#701516' })
set_hl(0, 'DevIconShCurrent', { bg = 'none', ctermbg= 'None', fg = '#4d5a5e' })
set_hl(0, 'DevIconConfCurrent', { bg = 'none', ctermbg= 'None', fg = '#6d8086' })
set_hl(0, 'DevIconPpCurrent', { bg = 'none', ctermbg= 'None', fg = '#ffa61a' })
set_hl(0, 'DevIconTsxCurrent', { bg = 'none', ctermbg= 'None', fg = '#1354bf' })

-- Invisiblish pane separators
set_hl(0, 'VertSplit', { bg = 'none', fg = theme['gray-95'] })

-- Floating borders
set_hl(0, 'PmenuBorder', { fg = theme['gray-85'], ctermfg = 'gray', bg = 'none', ctermbg = 'None' })
set_hl(0, 'FloatBorder', { fg = theme['gray-85'], ctermfg = 'gray', bg = 'none', ctermbg = 'None' })

-- LspInfo
set_hl(0, 'LspInfoBorder', { fg = theme['gray-95'], ctermfg = 'gray', bg = 'none', ctermbg = 'None' })

-- Git signs column plugin
set_hl(0, 'GitSignsAdd', { fg = 'SpringGreen2', bg = 'none' })
set_hl(0, 'GitSignsAddLn', { fg = 'SpringGreen2', bg = 'none' })
set_hl(0, 'GitSignsAddNr', { fg = 'SpringGreen2', bg = 'none' })
set_hl(0, 'GitSignsChange', { fg = 'MediumPurple2', bg = 'none' })
set_hl(0, 'GitSignsChangeLn', { fg = 'MediumPurple2', bg = 'none' })
set_hl(0, 'GitSignsChangeNr', { fg = 'MediumPurple2', bg = 'none' })
set_hl(0, 'GitSignsChangeDelete', { fg = 'Orange1', bg = 'none' })
set_hl(0, 'GitSignsChangeDeleteLn', { fg = 'Orange1', bg = 'none' })
set_hl(0, 'GitSignsChangeDeleteNr', { fg = 'Orange1', bg = 'none' })
set_hl(0, 'GitSignsUntracked', { fg = 'SkyBlue1', bg = 'none' })
set_hl(0, 'GitSignsUntrackedLn', { fg = 'SkyBlue1', bg = 'none' })
set_hl(0, 'GitSignsUntrackedNr', { fg = 'SkyBlue1', bg = 'none' })
set_hl(0, 'GitSignsTopDelete', { fg = 'Red1', bg = 'none' })
set_hl(0, 'GitSignsTopDeleteLn', { fg = 'Red1', bg = 'none' })
set_hl(0, 'GitSignsTopDeleteNr', { fg = 'Red1', bg = 'none' })
set_hl(0, 'GitSignsDelete', { fg = 'Red1', bg = 'none' })
set_hl(0, 'GitSignsDeleteLn', { fg = 'Red1', bg = 'none' })
set_hl(0, 'GitSignsDeleteNr', { fg = 'Red1', bg = 'none' })

-- Cursorline
set_hl(0, 'CursorLine', { bg = theme['gray-95'] })
set_hl(0, 'CursorLineNr', { bg = theme['gray-95'], fg = theme['orange-25'] }) -- Also highlight number column

-- Folds
set_hl(0, 'Folded', { bg =  'none', fg = theme['gray-85'], ctermbg = 'None', bold = false, nocombine = true })
set_hl(0, 'FoldColumn', { bg =  'none', fg = theme['gray-85'], ctermbg = 'None', bold = false, nocombine = true })

-- Highlight current row in NORMAL mode,
-- hide highlight in INSERT mode
autocmd({ 'InsertEnter', 'InsertLeave' }, { pattern = '*', command = 'set cul!' })
