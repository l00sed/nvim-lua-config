local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local M = {}

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

function formatDocument(client, bufnr)
	local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
	local event = "BufWritePre"
	local async = event == "BufWritePost"

	if client.supports_method("textDocument/formatting") then
		vim.keymap.set("n", "<Leader>p", function()
			vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
		end, { buffer = bufnr, desc = "[lsp] format" })

		-- format on save
		--vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
		--vim.api.nvim_create_autocmd(event, {
		--	buffer = bufnr,
		--	group = group,
		--	callback = function()
		--		vim.lsp.buf.format({ bufnr = bufnr, async = async })
		--	end,
		--	desc = "[lsp] format on save",
		--})
	end

	if client.supports_method("textDocument/rangeFormatting") then
		vim.keymap.set("x", "<Leader>p", function()
			vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
		end, { buffer = bufnr, desc = "[lsp] format" })
	end
end

null_ls.setup({
	--debug = true,
	on_attach = function(client, bufnr)
		formatDocument(client, bufnr)
	end,
	sources = {
		-- Formatting
		formatting.autopep8,
		--formatting.djlint.with({
		--	command = "djlint",
		--	extra_args = { "--check", "--profile", "django" },
		--}),
		formatting.clang_format.with({
			filetypes = { "cpp", "c" },
		}),
		formatting.gofumpt,
		formatting.prettier.with({
			filetypes = {
				"css",
				"djangohtml",
				"graphql",
				"html",
				"javascript",
				"javascriptreact",
				"json",
				"less",
				"markdown",
				"md",
				"scss",
				"solidity",
				"toml",
				"txt",
				"typescript",
				"typescriptreact",
				"vue",
				"yaml",
			},
		}),
		formatting.stylua,

		-- Diagnostics
		diagnostics.curlylint,
		diagnostics.djlint,
		diagnostics.flake8,
		diagnostics.puppet_lint,
	},
	border = "rounded",
})

function M.list_registered_providers_names(filetype)
	local s = require("null-ls.sources")
	local available_sources = s.get_available(filetype)
	local registered = {}
	for _, source in ipairs(available_sources) do
		for method in pairs(source.methods) do
			registered[method] = registered[method] or {}
			table.insert(registered[method], source.name)
		end
	end
	return registered
end

function M.list_registered_formatters(filetype)
	local registered_providers = M.list_registered_providers_names(filetype)
	local method = null_ls.methods.FORMATTING
	return registered_providers[method] or {}
end

function M.list_registered_linters(filetype)
	local registered_providers = M.list_registered_providers_names(filetype)
	local method = null_ls.methods.DIAGNOSTICS
	return registered_providers[method] or {}
end

return M
