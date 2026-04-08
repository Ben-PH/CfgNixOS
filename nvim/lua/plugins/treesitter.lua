-- treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- build = ":TSUpdate",
lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        -- ensure_installed = {
        --   "lua", "rust", "nix", "bash", "python", "json", "vim", "vimdoc", "wgsl"
        -- },
        auto_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
