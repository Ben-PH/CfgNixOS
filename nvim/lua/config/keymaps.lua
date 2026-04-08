local M = {}

-- General mappings: registered once at startup
M.general = {
  -- Telescope
  { "<A-f>", "<cmd>Telescope find_files<CR>",  desc = "Telescope: find files" },
  { "<A-g>", "<cmd>Telescope live_grep<CR>",   desc = "Telescope: grep" },

  -- Harpoon
  { "<leader>ha", function() require("harpoon"):list():append() end,                                desc = "Harpoon: add file" },
  { "<leader>hh", function() local h = require("harpoon") h.ui:toggle_quick_menu(h:list()) end,    desc = "Harpoon: menu" },
  { "<leader>h1", function() require("harpoon"):list():select(1) end,                              desc = "Harpoon: file 1" },
  { "<leader>h2", function() require("harpoon"):list():select(2) end,                              desc = "Harpoon: file 2" },
  { "<leader>h3", function() require("harpoon"):list():select(3) end,                              desc = "Harpoon: file 3" },
  { "<leader>h4", function() require("harpoon"):list():select(4) end,                              desc = "Harpoon: file 4" },

  -- Yazi
  { "<A-F>", function() require("yazi").yazi(nil, vim.fn.expand("%:p:h")) end, desc = "Yazi: open current dir" },

  -- Barbar
  { "<A-,>", "<cmd>BufferPrevious<CR>",        desc = "Buffer: previous",  hidden = true },
  { "<A-.>", "<cmd>BufferNext<CR>",            desc = "Buffer: next",      hidden = true },
  { "<A-c>", "<cmd>BufferClose<CR>",           desc = "Buffer: close" },
  { "<A-p>", "<cmd>BufferPick<CR>",            desc = "Buffer: pick" },
  { "<A-1>", "<cmd>BufferGoto 1<CR>",          hidden = true },
  { "<A-2>", "<cmd>BufferGoto 2<CR>",          hidden = true },
  { "<A-3>", "<cmd>BufferGoto 3<CR>",          hidden = true },
  { "<A-4>", "<cmd>BufferGoto 4<CR>",          hidden = true },
  { "<A-5>", "<cmd>BufferGoto 5<CR>",          hidden = true },
  { "<A-0>", "<cmd>BufferLast<CR>",            hidden = true },

  -- Which-key
  { "<A-w>", function() require("which-key").show() end, desc = "Which-key: show", mode = "nixsotc", hidden = true },

  -- Trouble
  { "<leader>tt", "<cmd>Trouble diagnostics toggle<CR>",        desc = "Trouble: diagnostics" },
  { "<leader>tf", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Trouble: buffer diagnostics" },
  { "<leader>tq", "<cmd>Trouble qflist toggle<CR>",             desc = "Trouble: quickfix" },
}

-- LSP mappings: buffer-local, registered on attach
M.lsp = function(bufnr)
  require("which-key").add({
    { "<A-R>",   "<cmd>Telescope lsp_references<CR>",      desc = "LSP: references",         buffer = bufnr },
    { "gD",      vim.lsp.buf.declaration,                  desc = "LSP: declaration",         buffer = bufnr },
    { "<C-D>",   "<cmd>Telescope lsp_definitions<CR>",     desc = "LSP: definitions",         buffer = bufnr },
    { "<A-i>",   "<cmd>Telescope lsp_implementations<CR>", desc = "LSP: implementations",     buffer = bufnr },
    { "<A-t>",   "<cmd>Telescope lsp_type_definitions<CR>",desc = "LSP: type definitions",    buffer = bufnr },
    { "<A-a>",   vim.lsp.buf.code_action,                  desc = "LSP: code action",         buffer = bufnr },
    { "<A-d>",   vim.diagnostic.goto_next,                 desc = "Diagnostic: next",         buffer = bufnr },
    { "<A-D>",   vim.diagnostic.goto_prev,                 desc = "Diagnostic: previous",     buffer = bufnr },
    { "<A-h>",   vim.lsp.buf.hover,                        desc = "LSP: hover docs",          buffer = bufnr },
    { "<A-C-d>", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Diagnostic: buffer list",  buffer = bufnr },
    { "<leader>rs", ":LspRestart<CR>",                     desc = "LSP: restart",             buffer = bufnr },
    { "<leader>rn", vim.lsp.buf.rename,                    desc = "LSP: rename",              buffer = bufnr },
  })
end

M.register = function()
  require("which-key").add(M.general)
end

return M
