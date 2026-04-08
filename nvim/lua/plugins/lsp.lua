return {
  -- Completion engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Snippet engine
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- Snippet collection
      "rafamadriz/friendly-snippets",

      -- LSP completion source
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      })
    end,
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      -- Lua dev environment awareness
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
      },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Attach keymaps and format command when LSP connects to a buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          require("config.keymaps").lsp(bufnr)
          vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
            vim.lsp.buf.format()
          end, {})
        end,
      })
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config('nil_ls', {
        capabilities = capabilities,
      })

      vim.lsp.config('rust_analyzer', {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              allTargets = true,
            },
            checkOnSave = true,
            procMacro = { enable = true },
          },
        },
      })

      vim.lsp.enable({'lua_ls', 'nil_ls', 'rust_analyzer'})
    end,
  },
  -- Crates.io integration
  {
    "saecki/crates.nvim",
    event = "BufReadPre Cargo.toml",
    config = function()
      require("crates").setup({
        completion = { crates = { enabled = true } },
        lsp = {
          enabled = true,
          actions = true,
          completion = true,
          hover = true,
        },
      })
    end,
  },

  -- Better diagnostics/quickfix UI
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup()
    end,
  },
}
