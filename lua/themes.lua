-- Themes
local cmd = vim.cmd
local set_hl = vim.api.nvim_set_hl
local autocmd = vim.api.nvim_create_autocmd
local utils = require('utils')

-- Lualine transparent bg
set_hl(0, 'lualine_transitional_lualine_a_replace_to_StatusLine', { bg = '#000000' })
set_hl(0, 'lualine_transitional_lualine_a_insert_to_StatusLine', { bg = '#000000' })
set_hl(0, 'lualine_transitional_lualine_a_normal_to_StatusLine', { bg = '#000000' })
set_hl(0, 'lualine_transitional_lualine_a_command_to_StatusLine', { bg = '#000000' })
set_hl(0, 'lualine_transitional_lualine_a_visual_to_StatusLine', { bg = '#000000' })

-- LSP Diagnostics
cmd [[
sign define DiagnosticSignError text= texthl=DiagnosticError linehl= numhl=
sign define DiagnosticSignWarn  text= texthl=DiagnosticWarn  linehl= numhl=
sign define DiagnosticSignInfo  text= texthl=DiagnosticInfo  linehl= numhl=
sign define DiagnosticSignHint  text= texthl=DiagnosticHint  linehl= numhl=
]]
set_hl(0, 'DiagnosticError', { fg = 'red', bg = '#000000' })
set_hl(0, 'DiagnosticWarn', { fg = 'orange', bg = '#000000' })
set_hl(0, 'DiagnosticInfo', { fg = 'teal', bg = '#000000' })
set_hl(0, 'DiagnosticHint', { fg = 'white', bg = '#000000' })

-- Bufferline Transparency
set_hl(0, 'BufferLineNumbersSelected', { bg = '#000000', fg = 'white' })
set_hl(0, 'BufferLineBufferSelected', { fg = white, bg = '#000000' })
set_hl(0, 'BufferLineDiagnosticSelected', { bg = '#000000' })
set_hl(0, 'BufferLineHintSelected', { bg = '#000000' })
set_hl(0, 'BufferLineHintDiagnosticSelected', { bg = '#000000' })
set_hl(0, 'BufferLineInfoSelected', { bg = '#000000' })
set_hl(0, 'BufferLineInfoDiagnosticSelected', { bg = '#000000' })
set_hl(0, 'BufferLineWarningSelected', { bg = '#000000' })
set_hl(0, 'BufferLineWarningDiagnosticSelected', { bg = '#000000' })
set_hl(0, 'BufferLineErrorSelected', { bg = '#000000' })
set_hl(0, 'BufferLineErrorDiagnosticSelected', { bg = '#000000' })
set_hl(0, 'BufferLineModifiedSelected', { bg = '#000000' })
set_hl(0, 'BufferLineModifiedDiagnosticSelected', { bg = '#000000' })
set_hl(0, 'BufferLineDuplicateSelected', { bg = '#000000' })
set_hl(0, 'BufferLineSeparatorSelected', { fg = '#000000', bg = '#000000' })

-- Extra HTML syntax highlighting
set_hl(0, 'htmlArg', { italic = true })
set_hl(0, 'htmlBold', { bold = true })
set_hl(0, 'htmlItalic', { italic = true })
set_hl(0, 'htmlBoldItalic', { bold = true, italic = true })

-- Additional Transparency
set_hl(0, 'Normal', { bg = '#000000', ctermbg = 'None' })
set_hl(0, 'SignColumn', { bg = '#000000' })
set_hl(0, 'Pmenu', { bg = '#000000', ctermbg = 'None' })
set_hl(0, 'NonText', { fg = 'gray', bg = '#000000' })
set_hl(0, 'NormalFloat', { bg = '#000000', ctermbg = 'None' })

local theme = {
  -- grays
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
set_hl(0, 'Comment', { bg = '#000000', fg = theme['gray-55'], italic = true })

-- Spelling
set_hl(0, 'SpellBad', { undercurl = true })
set_hl(0, 'SpellRare', { undercurl = true })
set_hl(0, 'SpellCap', { undercurl = true })
set_hl(0, 'SpellLocal', { undercurl = true })

-- Tab Icons
set_hl(0, 'DevIconDiffCurrent', { bg = '#000000', fg = '#41535b' })
set_hl(0, 'DevIconElmCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconJlCurrent', { bg = '#000000', fg = '#a270ba' })
set_hl(0, 'DevIconDockerfileCurrent', { bg = '#000000', fg = '#458ee6' })
set_hl(0, 'DevIconXcPlaygroundCurrent', { bg = '#000000', fg = '#e37933' })
set_hl(0, 'DevIconSlnCurrent', { bg = '#000000', fg = '#854cc7' })
set_hl(0, 'DevIconTclCurrent', { bg = '#000000', fg = '#1e5cb3' })
set_hl(0, 'DevIconFsxCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconTexCurrent', { bg = '#000000', fg = '#3d6117' })
set_hl(0, 'DevIconLuaCurrent', { bg = '#000000', fg = '#51a0cf' })
set_hl(0, 'DevIconJsxCurrent', { bg = '#000000', fg = '#20c2e3' })
set_hl(0, 'DevIconWasmCurrent', { bg = '#000000', fg = '#5c4cdb' })
set_hl(0, 'DevIconValaCurrent', { bg = '#000000', fg = '#7239b3' })
set_hl(0, 'DevIconGemfileCurrent', { bg = '#000000', fg = '#701516' })
set_hl(0, 'DevIconNPMrcCurrent', { bg = '#000000', fg = '#e8274b' })
set_hl(0, 'DevIconPlCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconMlCurrent', { bg = '#000000', fg = '#e37933' })
set_hl(0, 'DevIconMarkdownCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconCpCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconLogCurrent', { bg = '#000000', fg = '#ffffff' })
set_hl(0, 'DevIconPycCurrent', { bg = '#000000', fg = '#ffe291' })
set_hl(0, 'DevIconCppCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconEppCurrent', { bg = '#000000', fg = '#ffa61a' })
set_hl(0, 'DevIconGitConfigCurrent', { bg = '#000000', fg = '#41535b' })
set_hl(0, 'DevIconDesktopEntryCurrent', { bg = '#000000', fg = '#563d7c' })
set_hl(0, 'DevIconClojureCurrent', { bg = '#000000', fg = '#8dc149' })
set_hl(0, 'DevIconLiquidCurrent', { bg = '#000000', fg = '#95bf47' })
set_hl(0, 'DevIconHppCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconKotlinScriptCurrent', { bg = '#000000', fg = '#7f52ff' })
set_hl(0, 'DevIconBrewfileCurrent', { bg = '#000000', fg = '#701516' })
set_hl(0, 'DevIconExCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconMliCurrent', { bg = '#000000', fg = '#e37933' })
set_hl(0, 'DevIconEexCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconGitModulesCurrent', { bg = '#000000', fg = '#41535b' })
set_hl(0, 'DevIconEdnCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconGodotProjectCurrent', { bg = '#000000', fg = '#6d8086' })
set_hl(0, 'DevIconSvgCurrent', { bg = '#000000', fg = '#ffb13b' })
set_hl(0, 'DevIconXulCurrent', { bg = '#000000', fg = '#e37933' })
set_hl(0, 'DevIconDartCurrent', { bg = '#000000', fg = '#03589c' })
set_hl(0, 'DevIconCMakeCurrent', { bg = '#000000', fg = '#6d8086' })
set_hl(0, 'DevIconOrgModeCurrent', { bg = '#000000', fg = '#77aa99' })
set_hl(0, 'DevIconTextSceneCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconHxxCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconBazelCurrent', { bg = '#000000', fg = '#89e051' })
set_hl(0, 'DevIconCobolCurrent', { bg = '#000000', fg = '#005ca5' })
set_hl(0, 'DevIconCxxCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconGitLogoCurrent', { bg = '#000000', fg = '#f14c28' })
set_hl(0, 'DevIconJpegCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconWebpackCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconTomlCurrent', { bg = '#000000', fg = '#6d8086' })
set_hl(0, 'DevIconDocCurrent', { bg = '#000000', fg = '#185abd' })
set_hl(0, 'DevIconLessCurrent', { bg = '#000000', fg = '#563d7c' })
set_hl(0, 'DevIconPptCurrent', { bg = '#000000', fg = '#cb4a32' })
set_hl(0, 'DevIconBmpCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconSqlCurrent', { bg = '#000000', fg = '#dad8d8' })
set_hl(0, 'DevIconGitCommitCurrent', { bg = '#000000', fg = '#41535b' })
set_hl(0, 'DevIconPrismaCurrent', { bg = '#000000', fg = '#ffffff' })
set_hl(0, 'DevIconRlibCurrent', { bg = '#000000', fg = '#dea584' })
set_hl(0, 'DevIconBzlCurrent', { bg = '#000000', fg = '#89e051' })
set_hl(0, 'DevIconEnvCurrent', { bg = '#000000', fg = '#faf743' })
set_hl(0, 'DevIconFsharpCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconReScriptInterfaceCurrent', { bg = '#000000', fg = '#f55385' })
set_hl(0, 'DevIconLicenseCurrent', { bg = '#000000', fg = '#cbcb41' })
set_hl(0, 'DevIconYmlCurrent', { bg = '#000000', fg = '#6d8086' })
set_hl(0, 'DevIconXmlCurrent', { bg = '#000000', fg = '#e37933' })
set_hl(0, 'DevIconGvimrcCurrent', { bg = '#000000', fg = '#019833' })
set_hl(0, 'DevIconTwigCurrent', { bg = '#000000', fg = '#8dc149' })
set_hl(0, 'DevIconMjsCurrent', { bg = '#000000', fg = '#f1e05a' })
set_hl(0, 'DevIconSmlCurrent', { bg = '#000000', fg = '#e37933' })
set_hl(0, 'DevIconCjsCurrent', { bg = '#000000', fg = '#cbcb41' })
set_hl(0, 'DevIconHeexCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconCsonCurrent', { bg = '#000000', fg = '#cbcb41' })
set_hl(0, 'DevIconDsStoreCurrent', { bg = '#000000', fg = '#41535b' })
set_hl(0, 'DevIconVagrantfileCurrent', { bg = '#000000', fg = '#1563ff' })
set_hl(0, 'DevIconMixLockCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconDropboxCurrent', { bg = '#000000', fg = '#0061fe' })
set_hl(0, 'DevIconCMakeListsCurrent', { bg = '#000000', fg = '#6d8086' })
set_hl(0, 'DevIconExsCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconBinaryGLTFCurrent', { bg = '#000000', fg = '#ffb13b' })
set_hl(0, 'DevIconTypeScriptReactSpecCurrent', { bg = '#000000', fg = '#1354bf' })
set_hl(0, 'DevIconDumpCurrent', { bg = '#000000', fg = '#dad8d8' })
set_hl(0, 'DevIconZshprofileCurrent', { bg = '#000000', fg = '#89e051' })
set_hl(0, 'DevIconPsbCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconTextResourceCurrent', { bg = '#000000', fg = '#cbcb41' })
set_hl(0, 'DevIconSuoCurrent', { bg = '#000000', fg = '#854cc7' })
set_hl(0, 'DevIconNimCurrent', { bg = '#000000', fg = '#f3d400' })
set_hl(0, 'DevIconWebmanifestCurrent', { bg = '#000000', fg = '#f1e05a' })
set_hl(0, 'DevIconPackageLockJsonCurrent', { bg = '#000000', fg = '#7a0d21' })
set_hl(0, 'DevIconEslintrcCurrent', { bg = '#000000', fg = '#4b32c3' })
set_hl(0, 'DevIconLeexCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconMintCurrent', { bg = '#000000', fg = '#87c095' })
set_hl(0, 'DevIconTestJsCurrent', { bg = '#000000', fg = '#cbcb41' })
set_hl(0, 'DevIconWebpCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconVHDLCurrent', { bg = '#000000', fg = '#019833' })
set_hl(0, 'DevIconSystemVerilogCurrent', { bg = '#000000', fg = '#019833' })
set_hl(0, 'DevIconPsdCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconBabelrcCurrent', { bg = '#000000', fg = '#cbcb41' })
set_hl(0, 'DevIconHrlCurrent', { bg = '#000000', fg = '#b83998' })
set_hl(0, 'DevIconRbCurrent', { bg = '#000000', fg = '#701516' })
set_hl(0, 'DevIconGitlabCICurrent', { bg = '#000000', fg = '#e24329' })
set_hl(0, 'DevIconMakefileCurrent', { bg = '#000000', fg = '#6d8086' })
set_hl(0, 'DevIconBashProfileCurrent', { bg = '#000000', fg = '#89e051' })
set_hl(0, 'DevIconGitAttributesCurrent', { bg = '#000000', fg = '#41535b' })
set_hl(0, 'DevIconClojureCCurrent', { bg = '#000000', fg = '#8dc149' })
set_hl(0, 'DevIconTerraformCurrent', { bg = '#000000', fg = '#5f43e9' })
set_hl(0, 'DevIconPrologCurrent', { bg = '#000000', fg = '#e4b854' })
set_hl(0, 'DevIconFennelCurrent', { bg = '#000000', fg = '#fff3d7' })
set_hl(0, 'DevIconJson5Current', { bg = '#000000', fg = '#cbcb41' })
set_hl(0, 'DevIconTxtCurrent', { bg = '#000000', fg = '#89e051' })
set_hl(0, 'DevIconRCurrent', { bg = '#000000', fg = '#358a5b' })
set_hl(0, 'DevIconZshrcCurrent', { bg = '#000000', fg = '#89e051' })
set_hl(0, 'DevIconDocxCurrent', { bg = '#000000', fg = '#185abd' })
set_hl(0, 'DevIconJsonCurrent', { bg = '#000000', fg = '#cbcb41' })
set_hl(0, 'DevIconGifCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconRmdCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconXlsxCurrent', { bg = '#000000', fg = '#207245' })
set_hl(0, 'DevIconZshCurrent', { bg = '#000000', fg = '#89e051' })
set_hl(0, 'DevIconVerilogCurrent', { bg = '#000000', fg = '#019833' })
set_hl(0, 'DevIconCrystalCurrent', { bg = '#000000', fg = '#c8c8c8' })
set_hl(0, 'DevIconJpgCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconSpecJsCurrent', { bg = '#000000', fg = '#cbcb41' })
set_hl(0, 'DevIconBazelBuildCurrent', { bg = '#000000', fg = '#89e051' })
set_hl(0, 'DevIconJavaScriptReactTestCurrent', { bg = '#000000', fg = '#20c2e3' })
set_hl(0, 'DevIconFsscriptCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconSigCurrent', { bg = '#000000', fg = '#e37933' })
set_hl(0, 'DevIconZigCurrent', { bg = '#000000', fg = '#f69a1b' })
set_hl(0, 'DevIconSvelteCurrent', { bg = '#000000', fg = '#ff3e00' })
set_hl(0, 'DevIconCCurrent', { bg = '#000000', fg = '#599eff' })
set_hl(0, 'DevIconEjsCurrent', { bg = '#000000', fg = '#cbcb41' })
set_hl(0, 'DevIconGruntfileCurrent', { bg = '#000000', fg = '#e37933' })
set_hl(0, 'DevIconZshenvCurrent', { bg = '#000000', fg = '#89e051' })
set_hl(0, 'DevIconBazelWorkspaceCurrent', { bg = '#000000', fg = '#89e051' })
set_hl(0, 'DevIconCPlusPlusCurrent', { bg = '#000000', fg = '#f34b7d' })
set_hl(0, 'DevIconSettingsJsonCurrent', { bg = '#000000', fg = '#854cc7' })
set_hl(0, 'DevIconImportConfigurationCurrent', { bg = '#000000', fg = '#ececec' })
set_hl(0, 'DevIconVimrcCurrent', { bg = '#000000', fg = '#019833' })
set_hl(0, 'DevIconHtmlCurrent', { bg = '#000000', fg = '#e44d26' })
set_hl(0, 'DevIconSwiftCurrent', { bg = '#000000', fg = '#e37933' })
set_hl(0, 'DevIconClojureDartCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconStylCurrent', { bg = '#000000', fg = '#8dc149' })
set_hl(0, 'DevIconLhsCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconScalaCurrent', { bg = '#000000', fg = '#cc3e44' })
set_hl(0, 'DevIconTerminalCurrent', { bg = '#000000', fg = '#31b53e' })
set_hl(0, 'DevIconGulpfileCurrent', { bg = '#000000', fg = '#cc3e44' })
set_hl(0, 'DevIconCoffeeCurrent', { bg = '#000000', fg = '#cbcb41' })
set_hl(0, 'DevIconSolidityCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconPsScriptModulefileCurrent', { bg = '#000000', fg = '#6975c4' })
set_hl(0, 'DevIconHamlCurrent', { bg = '#000000', fg = '#eaeae1' })
set_hl(0, 'DevIconNPMIgnoreCurrent', { bg = '#000000', fg = '#e8274b' })
set_hl(0, 'DevIconXlsCurrent', { bg = '#000000', fg = '#207245' })
set_hl(0, 'DevIconAwkCurrent', { bg = '#000000', fg = '#4d5a5e' })
set_hl(0, 'DevIconGoCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconScssCurrent', { bg = '#000000', fg = '#f55385' })
set_hl(0, 'DevIconTFVarsCurrent', { bg = '#000000', fg = '#5f43e9' })
set_hl(0, 'DevIconRsCurrent', { bg = '#000000', fg = '#dea584' })
set_hl(0, 'DevIconPhpCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconHtmCurrent', { bg = '#000000', fg = '#e34c26' })
set_hl(0, 'DevIconTsCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconPngCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconMotokoCurrent', { bg = '#000000', fg = '#9772fb' })
set_hl(0, 'DevIconReScriptCurrent', { bg = '#000000', fg = '#cc3e44' })
set_hl(0, 'DevIconDefaultCurrent', { bg = '#000000', fg = '#6d8086' })
set_hl(0, 'DevIconsbtCurrent', { bg = '#000000', fg = '#cc3e44' })
set_hl(0, 'DevIconProcfileCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconRssCurrent', { bg = '#000000', fg = '#fb9d3b' })
set_hl(0, 'DevIconCsCurrent', { bg = '#000000', fg = '#596706' })
set_hl(0, 'DevIconFsCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconKotlinCurrent', { bg = '#000000', fg = '#7f52ff' })
set_hl(0, 'DevIconBatCurrent', { bg = '#000000', fg = '#c1f12e' })
set_hl(0, 'DevIconHbsCurrent', { bg = '#000000', fg = '#f0772b' })
set_hl(0, 'DevIconJsCurrent', { bg = '#000000', fg = '#cbcb41' })
set_hl(0, 'DevIconMdxCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconHsCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconKshCurrent', { bg = '#000000', fg = '#4d5a5e' })
set_hl(0, 'DevIconGraphQLCurrent', { bg = '#000000', fg = '#e535ab' })
set_hl(0, 'DevIconBashrcCurrent', { bg = '#000000', fg = '#89e051' })
set_hl(0, 'DevIconOPUSCurrent', { bg = '#000000', fg = '#f88a02' })
set_hl(0, 'DevIconCshCurrent', { bg = '#000000', fg = '#4d5a5e' })
set_hl(0, 'DevIconCssCurrent', { bg = '#000000', fg = '#42a5f5' })
set_hl(0, 'DevIconFortranCurrent', { bg = '#000000', fg = '#734f96' })
set_hl(0, 'DevIconConfigurationCurrent', { bg = '#000000', fg = '#ececec' })
set_hl(0, 'DevIconGemspecCurrent', { bg = '#000000', fg = '#701516' })
set_hl(0, 'DevIconPmCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconConfigRuCurrent', { bg = '#000000', fg = '#701516' })
set_hl(0, 'DevIconTestTsCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconPackageJsonCurrent', { bg = '#000000', fg = '#e8274b' })
set_hl(0, 'DevIconErlCurrent', { bg = '#000000', fg = '#b83998' })
set_hl(0, 'DevIconDroolsCurrent', { bg = '#000000', fg = '#ffafaf' })
set_hl(0, 'DevIconQueryCurrent', { bg = '#000000', fg = '#90a850' })
set_hl(0, 'DevIconSchemeCurrent', { bg = '#000000', fg = '#000000' })
set_hl(0, 'DevIconDbCurrent', { bg = '#000000', fg = '#dad8d8' })
set_hl(0, 'DevIconPyCurrent', { bg = '#000000', fg = '#ffbc03' })
set_hl(0, 'DevIconMaterialCurrent', { bg = '#000000', fg = '#b83998' })
set_hl(0, 'DevIconIniCurrent', { bg = '#000000', fg = '#6d8086' })
set_hl(0, 'DevIconDCurrent', { bg = '#000000', fg = '#427819' })
set_hl(0, 'DevIconOpenTypeFontCurrent', { bg = '#000000', fg = '#ececec' })
set_hl(0, 'DevIconRakeCurrent', { bg = '#000000', fg = '#701516' })
set_hl(0, 'DevIconLockCurrent', { bg = '#000000', fg = '#bbbbbb' })
set_hl(0, 'DevIconClojureJSCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconBashCurrent', { bg = '#000000', fg = '#89e051' })
set_hl(0, 'DevIconIcoCurrent', { bg = '#000000', fg = '#cbcb41' })
set_hl(0, 'DevIconAiCurrent', { bg = '#000000', fg = '#cbcb41' })
set_hl(0, 'DevIconRprojCurrent', { bg = '#000000', fg = '#358a5b' })
set_hl(0, 'DevIconVueCurrent', { bg = '#000000', fg = '#8dc149' })
set_hl(0, 'DevIconGDScriptCurrent', { bg = '#000000', fg = '#6d8086' })
set_hl(0, 'DevIconGitIgnoreCurrent', { bg = '#000000', fg = '#41535b' })
set_hl(0, 'DevIconJavaCurrent', { bg = '#000000', fg = '#cc3e44' })
set_hl(0, 'DevIconFaviconCurrent', { bg = '#000000', fg = '#cbcb41' })
set_hl(0, 'DevIconHCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconPdfCurrent', { bg = '#000000', fg = '#b30b00' })
set_hl(0, 'DevIconPydCurrent', { bg = '#000000', fg = '#ffe291' })
set_hl(0, 'DevIconNodeModulesCurrent', { bg = '#000000', fg = '#e8274b' })
set_hl(0, 'DevIconSassCurrent', { bg = '#000000', fg = '#f55385' })
set_hl(0, 'DevIconNixCurrent', { bg = '#000000', fg = '#7ebae4' })
set_hl(0, 'DevIconLuauCurrent', { bg = '#000000', fg = '#51a0cf' })
set_hl(0, 'DevIconYamlCurrent', { bg = '#000000', fg = '#6d8086' })
set_hl(0, 'DevIconPsScriptfileCurrent', { bg = '#000000', fg = '#4273ca' })
set_hl(0, 'DevIconSpecTsCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconHhCurrent', { bg = '#000000', fg = '#a074c4' })
set_hl(0, 'DevIconCsvCurrent', { bg = '#000000', fg = '#89e051' })
set_hl(0, 'DevIconPyoCurrent', { bg = '#000000', fg = '#ffe291' })
set_hl(0, 'DevIconVimCurrent', { bg = '#000000', fg = '#019833' })
set_hl(0, 'DevIconMdCurrent', { bg = '#000000', fg = '#ffffff' })
set_hl(0, 'DevIconPsManifestfileCurrent', { bg = '#000000', fg = '#6975c4' })
set_hl(0, 'DevIconSlimCurrent', { bg = '#000000', fg = '#e34c26' })
set_hl(0, 'DevIconFishCurrent', { bg = '#000000', fg = '#4d5a5e' })
set_hl(0, 'DevIconJavaScriptReactSpecCurrent', { bg = '#000000', fg = '#20c2e3' })
set_hl(0, 'DevIconMustacheCurrent', { bg = '#000000', fg = '#e37933' })
set_hl(0, 'DevIconFsiCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconTorCurrent', { bg = '#000000', fg = '#519aba' })
set_hl(0, 'DevIconRakefileCurrent', { bg = '#000000', fg = '#701516' })
set_hl(0, 'DevIconTypeScriptReactTestCurrent', { bg = '#000000', fg = '#1354bf' })
set_hl(0, 'DevIconPackedResourceCurrent', { bg = '#000000', fg = '#6d8086' })
set_hl(0, 'DevIconErbCurrent', { bg = '#000000', fg = '#701516' })
set_hl(0, 'DevIconShCurrent', { bg = '#000000', fg = '#4d5a5e' })
set_hl(0, 'DevIconConfCurrent', { bg = '#000000', fg = '#6d8086' })
set_hl(0, 'DevIconPpCurrent', { bg = '#000000', fg = '#ffa61a' })
set_hl(0, 'DevIconTsxCurrent', { bg = '#000000', fg = '#1354bf' })

-- Invisiblish pane separators
set_hl(0, 'VertSplit', { bg = '#000000', fg = theme['gray-95'] })

-- Floating borders
set_hl(0, 'PmenuBorder', { fg = theme['gray-85'], ctermfg = 'gray', bg = '#000000', ctermbg = 'None' })
set_hl(0, 'FloatBorder', { fg = theme['gray-85'], ctermfg = 'gray', bg = '#000000', ctermbg = 'None' })

-- LspInfo
set_hl(0, 'LspInfoBorder', { fg = theme['gray-95'], ctermfg = 'gray', bg = '#000000', ctermbg = 'None' })

-- Git signs column plugin
set_hl(0, 'GitSignsAdd', { fg = 'SpringGreen2', bg = '#000000' })
set_hl(0, 'GitSignsAddLn', { fg = 'SpringGreen2', bg = '#000000' })
set_hl(0, 'GitSignsAddNr', { fg = 'SpringGreen2', bg = '#000000' })
set_hl(0, 'GitSignsChange', { fg = 'MediumPurple2', bg = '#000000' })
set_hl(0, 'GitSignsChangeLn', { fg = 'MediumPurple2', bg = '#000000' })
set_hl(0, 'GitSignsChangeNr', { fg = 'MediumPurple2', bg = '#000000' })
set_hl(0, 'GitSignsChangeDelete', { fg = 'Orange1', bg = '#000000' })
set_hl(0, 'GitSignsChangeDeleteLn', { fg = 'Orange1', bg = '#000000' })
set_hl(0, 'GitSignsChangeDeleteNr', { fg = 'Orange1', bg = '#000000' })
set_hl(0, 'GitSignsUntracked', { fg = 'SkyBlue1', bg = '#000000' })
set_hl(0, 'GitSignsUntrackedLn', { fg = 'SkyBlue1', bg = '#000000' })
set_hl(0, 'GitSignsUntrackedNr', { fg = 'SkyBlue1', bg = '#000000' })
set_hl(0, 'GitSignsTopDelete', { fg = 'Red1', bg = '#000000' })
set_hl(0, 'GitSignsTopDeleteLn', { fg = 'Red1', bg = '#000000' })
set_hl(0, 'GitSignsTopDeleteNr', { fg = 'Red1', bg = '#000000' })
set_hl(0, 'GitSignsDelete', { fg = 'Red1', bg = '#000000' })
set_hl(0, 'GitSignsDeleteLn', { fg = 'Red1', bg = '#000000' })
set_hl(0, 'GitSignsDeleteNr', { fg = 'Red1', bg = '#000000' })

-- Cursorline
set_hl(0, 'CursorLine', { bg = theme['gray-95'] })
set_hl(0, 'CursorLineNr', { bg = theme['gray-95'], fg = theme['orange-25'] }) -- Also highlight number column

-- Folds
set_hl(0, 'Folded', { bg =  '#000000', fg = theme['gray-85'], bold = false, nocombine = true })

-- Highlight current row in NORMAL mode,
-- hide highlight in INSERT mode
autocmd({ 'InsertEnter', 'InsertLeave' }, { pattern = '*', command = 'set cul!' })
