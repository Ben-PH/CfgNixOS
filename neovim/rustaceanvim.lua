-- Configure RustaceanVim using the options defined above
require('rustaceanvim').setup({
    server = {
        -- Custom on_attach function, if you have key bindings defined elsewhere
        on_attach = function(_, bufnr)
            local wk = require("which-key")
            -- Assuming you have a wk_mappings.lua file defining rust-specific mappings
            local bindings = require("wk_mappings").rust_bindings()
            wk.register(bindings, { buffer = bufnr })
        end,

        -- Rust-analyzer configuration
        default_settings = {
            ["rust-analyzer"] = {
                cargo = {
                    allFeatures = true,
                    loadOutDirsFromCheck = true,
                    buildScripts = { enable = true }
                },
                checkOnSave = true,
                procMacro = {
                    enable = true,
                    ignored = {
                        ["async-trait"] = { "async_trait" },
                        ["napi-derive"] = { "napi" },
                        ["async-recursion"] = { "async_recursion" }
                    }
                }
            }
        }
    }
})
