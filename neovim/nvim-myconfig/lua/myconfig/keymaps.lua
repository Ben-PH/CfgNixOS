--- Functons that delver wk-mappings

local M = {}

M.wk = function()
	return require("which-key")
end

M.rust_bindings = function()
	return {
		-- TODO: make use of the bang = true to repeat previous
		{ "J", function() vim.cmd.RustLsp("joinLines") end, desc = "RST: Line join", hidden = true },
		{ "<A-a>", function() vim.cmd.RustLsp("codeAction") end, desc = "RST: Action" },
		{ "<A-H>", function() vim.cmd.RustLsp{"hover", "action"} end, desc = "RST: ???" },
		{ "<A-r>", function() vim.cmd.RustLsp{"hover", "range"} end, desc = "RST: ???" },
		{ "<leader>rc", function() vim.cmd.RustLsp("openCargo") end, desc = "RST: Cargo open file" },
		{ "<leader>rC", function() vim.cmd.RustLsp("renderDiagnostic") end, desc = "RST: Cargo render" },
		{ "<leader>rd", function() vim.cmd.RustLsp("debuggables") end, desc = "RST: Debuggables" },
		{ "<leader>rfs", function() vim.cmd.RustLsp("workspaceSymbol") end, desc = "RST: find symbols" },
		{ "<leader>rhh", ":h rustaceanvim<cr>", desc = "RST: Help" },
		{ "<leader>rhd", function() vim.cmd.RustLsp("openDocs") end, desc = "RST: Open doc under cursor" },
		-- TODO: optional '<onlyTypes|allSymbols>', '<query>', or bang = true
		-- : 
		-- { "<leader>rfS", function() vim.cmd.RustLsp("workspaceSymbol") end, desc = "RST: Debuggables" },
		{ "<leader>rR", function() vim.cmd.RustLsp("runnables") end, desc = "RST: Runnables" },
		{ "<leader>rr", function() vim.cmd.RustLsp("run") end, desc = "RST: Run" },
		{ "<leader>rt", function() vim.cmd.RustLsp("testables") end, desc = "RST: Testables" },
		{ "<leader>rgk", function() vim.cmd.RustLsp("parentModule") end, desc = "RST: Module Up" },
		{ "<leader>rM", function() vim.cmd.RustLsp("expandMacro") end, desc = "RST: MacroExpand" },
		{ "<A-e>", function() vim.cmd.RustLsp ( "explainError" ) end, desc = "RST: Error explain" },
		{ "<A-K>", function() vim.cmd.RustLsp { "moveItem", "up" } end, desc = "RST: Mv ↑" },
		{ "<A-J>", function() vim.cmd.RustLsp { "moveItem", "down" } end, desc = "RST: Mv ↓" },
		{ "<leader>rR", function() vim.cmd.RustLsp { "ssr"--[[ , "<query>" ]] } end, desc = "RST: SED smartly" },
		-- todo: continue going through https://github.com/mrcjkb/rustaceanvim?tab=readme-ov-file#books-usage--features and adding
	}
end

M.auto_session = function()
	return {
		{ '<A-s>', '<Cmd>Autosession search<CR>', desc = "Session search", hidden = true },
		{ '<A-S>', '<Cmd>SessionRestore<CR>',     desc = "Session Restore" }
	}
end

M.barbar = function()
	return {

		-- Move to previous/next
		{ '<A-,>',     '<Cmd>BufferPrevious<CR>',           hidden = true },
		{ '<A-.>',     '<Cmd>BufferNext<CR>',               hidden = true },
		-- Re-order to previous/next
		{ '<A-<>',     '<Cmd>BufferMovePrevious<CR>' },
		{ '<A->>',     '<Cmd>BufferMoveNext<CR>' },
		-- Goto buffer in position...
		{ '<A-1>',     '<Cmd>BufferGoto 1<CR>' },
		{ '<A-2>',     '<Cmd>BufferGoto 2<CR>',             hidden = true },
		{ '<A-3>',     '<Cmd>BufferGoto 3<CR>',             hidden = true },
		{ '<A-4>',     '<Cmd>BufferGoto 4<CR>',             hidden = true },
		{ '<A-5>',     '<Cmd>BufferGoto 5<CR>',             hidden = true },
		{ '<A-6>',     '<Cmd>BufferGoto 6<CR>',             hidden = true },
		{ '<A-7>',     '<Cmd>BufferGoto 7<CR>',             hidden = true },
		{ '<A-8>',     '<Cmd>BufferGoto 8<CR>',             hidden = true },
		{ '<A-9>',     '<Cmd>BufferGoto 9<CR>',             hidden = true },
		{ '<A-0>',     '<Cmd>BufferLast<CR>' },
		-- Pin/unpin buffer
		{ '<C-p>',     '<Cmd>BufferPin<CR>' },
		-- Close buffer
		{ '<A-c>',     '<Cmd>BufferClose<CR>' },
		-- Wipeout buffer
		--                 :BufferWipeout
		-- Close commands
		--                 :BufferCloseAllButCurrent
		--                 :BufferCloseAllButPinned
		--                 :BufferCloseAllButCurrentOrPinned
		--                 :BufferCloseBuffersLeft
		--                 :BufferCloseBuffersRight
		-- Magic buffer-picking mode
		{ '<A-p>',     '<Cmd>BufferPick<CR>' },
		-- Sort automatically by...
		{ '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>' },
		{ '<Space>bn', '<Cmd>BufferOrderByName<CR>' },
		{ '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>' },
		{ '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>' },
		{ '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>' },
	}
end

M.bufferline = function()
end

M.colorscheme = function()
end

M.comment = function()
end

M.dressing = function()
end

M.init = function()
end

M.lspconfig = function(buf)
	return {
		{ "<A-R>",      "<cmd>Telescope lsp_references<CR>",       desc = "LSP references",                                  buffer = buf },
		{ "gD",         vim.lsp.buf.declaration,                   desc = "LSP Go to declaration",                           buffer = buf },
		{ "<C-D>",      "<cmd>Telescope lsp_definitions<CR>",      desc = "LSP definitions",                                 buffer = buf },
		{ "<A-i>",      "<cmd>Telescope lsp_implementations<CR>",  desc = "LSP implementations",                             buffer = buf },
		{ "<A-t>",      "<cmd>Telescope lsp_type_definitions<CR>", desc = "LSP type definitions",                            buffer = buf },
		{ "<A-a>",      vim.lsp.buf.code_action,                   desc = "LSP See available code actions",                  buffer = buf },
		{ "<A-C-d>",    "<cmd>Telescope diagnostics bufnr=0<CR>",  desc = "Dia Show buffer diagnostics",                     buffer = buf },
		{ "<A-D>",      vim.diagnostic.goto_prev,                  desc = "Dia Go to previous diagnostic",                   buffer = buf },
		{ "<A-d>",      vim.diagnostic.goto_next,                  desc = "Dia Go to next diagnostic",                       buffer = buf },
		{ "<A-h>",      vim.lsp.buf.hover,                         desc = "Doc Show documentation for what is under cursor", buffer = buf },
		{ "<leader>rs", ":LspRestart<CR>",                         desc = "LSP Restart",                                     buffer = buf },
	}
end

M.mason = function()
end

M.lualine = function()
end

M.nvim_cmp = function()
end

M.surround = function()
end

M.telescope = function()
end

M.treesitter = function()
end

M.vim_maximizer = function()
end

M.which_key_hide = function()
	return {
		{ "0", hidden = true },
		{ "b", hidden = true },
		{ "B", hidden = true },
		{ "d", hidden = true },
		{ "D", hidden = true },
		{ "e", hidden = true },
		{ "E", hidden = true },
		{ "f", hidden = true },
		{ "F", hidden = true },
		{ "G", hidden = true },
		{ "s", hidden = true },
		{ "S", hidden = true },
		{ "v", hidden = true },
		{ "V", hidden = true },
		{ "w", hidden = true },
		{ "W", hidden = true },
		{ "i", hidden = true },
		{ "I", hidden = true },
		{ "q", hidden = true },
		{ "r", hidden = true },
		{ "y", hidden = true },
		{ "$", hidden = true },
		{ "^", hidden = true },
		{ ";", hidden = true },
		{ "<", hidden = true },
		{ ">", hidden = true },
		{ "c", hidden = true },
		{ "H", hidden = true },
		{ "J", hidden = true },
		{ "K", hidden = true },
		{ "L", hidden = true },
		{ "h", hidden = true },
		{ "j", hidden = true },
		{ "k", hidden = true },
		{ "l", hidden = true },
		{ "?", hidden = true },
		{ "!", hidden = true },
		{ "%", hidden = true },
		{ "/", hidden = true },
		{ "{", hidden = true },
		{ "}", hidden = true },
	}
end

M.yazi = function()
	return {
		{
			"<A-f>",
			function() require("yazi").yazi(nil, vim.fn.expand("%:p:h")) end,
			desc = "Open the file manager in nvim's working directory",
		},
	}
end

M.wk().add({
	{ "<A-w>", function() M.wk().show() end, mode = "nixsotc", hidden = true },
	{ "<A-W>", ":w<cr>" }
})
M.wk().add(M.which_key_hide())

return M
