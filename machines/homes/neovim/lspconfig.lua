local lspconfig = require("lspconfig")
local on_attach = function(_, bufnr)

  local bufmap = function(keys, func)
    vim.keymap.set('n', keys, func, { buffer = bufnr })
  end

  bufmap('<leader>r', vim.lsp.buf.rename)
  bufmap('<leader>a', vim.lsp.buf.code_action)

  bufmap('gd', vim.lsp.buf.definition)
  bufmap('gD', vim.lsp.buf.declaration)
  bufmap('gI', vim.lsp.buf.implementation)
  bufmap('<leader>D', vim.lsp.buf.type_definition)

  bufmap('gr', require('telescope.builtin').lsp_references)
  bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
  bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

  bufmap('K', vim.lsp.buf.hover)

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
	root_dir = function()
        return vim.loop.cwd()
    end,
	cmd = { "lua-lsp" },
    settings = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    }
}

lspconfig.nil_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { lsp_path },
}
lspconfig.rust_analyzer.setup{
    settings = {
        ["rust-analyzer"] = {
            check = {allTargets = true },
            cargo = { features = "all" },
            -- cargo = { allFeatures = true },

            diagnostics = {
                enable = true;
                experimental = {
                    enable = true;
                },
            },
            checkOnSave = {
                command = "clippy" -- Optionally use Clippy for checks
            },
        }
    },
    on_attach = on_attach,
    capabilities = capabilities,
    on_init = function(client)
        local current_dir = vim.fn.fnamemodify(vim.fn.expand('%:p'), ':h')
        client.config.root_dir = current_dir
    end,
    root_dir = function(fname)
        -- Search for Cargo.toml in current or parent directories, fallback to cwd
        return lspconfig.util.root_pattern("Cargo.toml")(fname) or vim.loop.cwd()
    end,
}
